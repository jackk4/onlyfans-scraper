r"""
               _          __                                                                      
  ___   _ __  | | _   _  / _|  __ _  _ __   ___         ___   ___  _ __   __ _  _ __    ___  _ __ 
 / _ \ | '_ \ | || | | || |_  / _` || '_ \ / __| _____ / __| / __|| '__| / _` || '_ \  / _ \| '__|
| (_) || | | || || |_| ||  _|| (_| || | | |\__ \|_____|\__ \| (__ | |   | (_| || |_) ||  __/| |   
 \___/ |_| |_||_| \__, ||_|   \__,_||_| |_||___/       |___/ \___||_|    \__,_|| .__/  \___||_|   
                  |___/                                                        |_|                
"""

import json
import pathlib

from .prompts import config_prompt
from ..constants import configPath, configFile


def read_config():
    configPathlib = pathlib.Path(configPath)
    if not configPathlib.is_dir():
        configPathlib.mkdir(parents=True, exist_ok=True)

    config = {}
    while True:
        try:
            with open(configPathlib / configFile, 'r') as f:
                config = json.load(f)

            try:
                if [*config['config']] != [*get_current_config_schema(config)['config']]:
                    config = auto_update_config(configPathlib, config)
            except KeyError:
                raise FileNotFoundError

            break
        except FileNotFoundError:
            file_not_found_message = f"You don't seem to have a `config.json` file. One has been automatically created for you at: '{configPathlib / configFile}'"

            make_config(configPathlib, config)
            print(file_not_found_message)
    return config


def get_current_config_schema(config: dict) -> dict:
    config = config['config']
    new_config = {
        'config': config
    }
    return new_config


def make_config(path, config):
    config = {
        'config': {
            'main_profile': 'default',
            'save_location': 'content',
            'file_size_limit': '',
            'list': ''
        }
    }

    with open(path / configFile, 'w') as f:
        f.write(json.dumps(config, indent=4))


def update_config(field: str, value):
    p = pathlib.Path(configPath, configFile)

    with open(p, 'r') as f:
        config = json.load(f)

    config['config'].update({field: value})

    with open(p, 'w') as f:
        f.write(json.dumps(config, indent=4))


def auto_update_config(path, config: dict) -> dict:
    print("Auto updating...")
    new_config = get_current_config_schema(config)

    with open(path / configFile, 'w') as f:
        f.write(json.dumps(new_config, indent=4))

    return new_config


def edit_config():
    p = pathlib.Path(configPath, configFile)

    with open(p, 'r') as f:
        config = json.load(f)

    updated_config = {
        'config': config_prompt(config['config'])
    }

    with open(p, 'w') as f:
        f.write(json.dumps(updated_config, indent=4))

    print('`config.json` has been successfully edited.')

CONFIG = read_config()['config']
