# jbrowse-enterovirus

Package to download and process RefSeq human enterovirus data for jbrowse 

## Static site 
The static site for this can be found [HERE](https://vannytrinh.github.io/jbrowse-static/)  
For MSA visualization, the user must set the plug in and files up in GUI. Please follow directions below or on the [static page documentation](https://github.com/vannytrinh/jbrowse-static).

## set up
Before downloading the enterovirus database, please follow the steps below 

### jbrowse set up 
Install and run jbrowse on the web using CLI [HERE](https://jbrowse.org/jb2/docs/quickstart_web/)

### prerequisites 
Please install these programs  
- minimap2
- mafft
- veryfasttree

To install with homebrew 
```
brew install minimap2
brew install mafft
brew install veryfasttree
```

## download 
Clone this repo
```
git clone https://github.com/vannytrinh/jbrowse-enterovirus.git
cd jbrowse-enterovirus
```

Define path where jbrowse is stored. For a normal linux installation, the folder should be `/var/www` or `/var/www/html`, whereas when you install on macOS using brew it will likely be in `/opt/homebrew/var/www` (for M1) or `/usr/local/var/www` (for Intel).

```
export APACHE_ROOT='/path/to/rootdir'
```

Navigate to the scripts folder and make all scripts executable

```
cd scripts 
chmod +x *.sh
```

Run all scripts
```
./download_data.sh
./process_data.sh
./add_to_jbrowse.sh
```

## use

You can now open jbrowse at `http://yourhost/jbrowse2/`
Replace `localhost` with your hostname. 

### MSA

To view the MSA 
1. Install MsaView plugin by going to Tools > Plugin Store > Install MsaView 
2. Open up MSA by going to Add > Multiple sequence alignment view 
3. Select alignment.clustal file for MSA file 
4. Select tree.nwk for Tree file

These files are located in the scripts folder where we ran the commands. (They can also be found in and downloaded from the repo of the static site)
