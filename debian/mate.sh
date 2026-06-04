#!/data/data/com.termux/files/usr/bin/bash
set -euo
termux-setup-storage
# Update installed package but keep configuration
apt update
apt upgrade -y -o Dpkg::Options::="--force-confold"

# Install depedency
apt install curl wget nano proot tar xz-utils -y

# download and extract rootfs under /data/data/com.termux/files/home/pd-21/<distroname>
echo "download and extract rootfs under /data/data/com.termux/files/home/pd-21/<distroname>"

ARCH=$(uname -m)
case "$ARCH" in
    armhf|arm|armv7l) 
        ARCH="arm" 
        ;;
    aarch64|arm64) 
        ARCH="aarch64" 
        ;;
    x86_64|amd64)
        ARCH="x86_64"
        ;;
    i386|386)
        ARCH="i386"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

mkdir -p /data/data/com.termux/files/home/pd-21/debian-mate/debian
cd /data/data/com.termux/files/home/pd-21/debian-mate
curl -L https://github.com/arfshl/pd-21/releases/download/debian/debian-$ARCH.tar.xz --output debian.tar.xz
proot --link2symlink tar -xJpf debian.tar.xz -C debian
rm debian.tar.xz
mkdir -p /data/data/com.termux/files/home/pd-21/debian-mate/binds
mkdir -p /data/data/com.termux/files/home/pd-21/debian-mate/debian/proc/fakethings

# A function for preparing fake content for certain system data interfaces which known to be restricted on Android OS.
# All /proc entries are based on values retrieved from Fedora 43 KDE running on an expertbook-b1402cba, intel i3-1215u, and 8 GB of memory. Date 27/4/2026, Linux version 6.19.13-200.fc43.x86_64 
# Dedicated for: 1004200828
if [ ! -f "/data/data/com.termux/files/home/pd-21/debian-mate/debian/proc/fakethings/version" ]; then
cat << "EOF" > "/data/data/com.termux/files/home/pd-21/debian-mate/debian/proc/fakethings/version"
Linux version 6.19.13-1004200828 (arfshl@pd-21) (gcc (GCC) 15.2.1 12092021 (05232022) GNU ld version 2.45.10-31012026 #1 SMP PREEMPT_DYNAMIC Fri Apr 10 04:52:00 WIB 2026
EOF
fi

if [ ! -f "/data/data/com.termux/files/home/pd-21/debian-mate/debian/proc/fakethings/stat" ]; then
cat << "EOF" > "/data/data/com.termux/files/home/pd-21/debian-mate/debian/proc/fakethings/stat"
cpu  97011 93 28431 2110461 1305 8475 3662 0 0 0
cpu0 14596 1 2768 260831 238 944 1286 0 0 0
cpu1 10120 13 2172 267769 169 692 524 0 0 0
cpu2 18127 28 4330 256553 232 1017 431 0 0 0
cpu3 7131 23 1571 272633 104 359 242 0 0 0
cpu4 12044 11 4712 260870 195 2689 362 0 0 0
cpu5 12568 0 4598 262577 132 954 307 0 0 0
cpu6 12834 1 4779 262402 125 856 258 0 0 0
cpu7 9588 11 3499 266822 108 961 249 0 0 0
intr 5301718 0 1043 0 0 0 0 0 0 0 458 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 493862 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 73784 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 11112 0 0 0 0 0 0 0 64 9109 8205 8624 5260 6866 5097 5179 4485 169994 48 1411 17656 1984 678 1244 2188 1110 661 720 344 5 19918 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
ctxt 8243615
btime 1777295712
processes 5985
procs_running 2
procs_blocked 0
softirq 3074005 2127 586528 59 28761 72 0 14413 1445298 0 996747
EOF
fi

if [ ! -f "/data/data/com.termux/files/home/pd-21/debian-mate/debian/proc/fakethings/vmstat" ]; then
cat << "EOF" > "/data/data/com.termux/files/home/pd-21/debian-mate/debian/proc/fakethings/vmstat"
nr_free_pages 106785
nr_free_pages_blocks 54272
nr_zone_inactive_anon 0
nr_zone_active_anon 824464
nr_zone_inactive_file 369777
nr_zone_active_file 272971
nr_zone_unevictable 170682
nr_zone_write_pending 269
nr_mlock 29
nr_zspages 3
nr_free_cma 0
nr_unaccepted 0
numa_hit 6517425
numa_miss 0
numa_foreign 0
numa_interleave 5014
numa_local 6517425
numa_other 0
nr_inactive_anon 0
nr_active_anon 824464
nr_inactive_file 369777
nr_active_file 272971
nr_unevictable 170682
nr_slab_reclaimable 16316
nr_slab_unreclaimable 46863
nr_isolated_anon 0
nr_isolated_file 0
workingset_nodes 0
workingset_refault_anon 0
workingset_refault_file 0
workingset_activate_anon 0
workingset_activate_file 0
workingset_restore_anon 0
workingset_restore_file 0
workingset_nodereclaim 0
nr_anon_pages 1017057
nr_mapped 188703
nr_file_pages 620870
nr_dirty 269
nr_writeback 0
nr_shmem 190196
nr_shmem_hugepages 297
nr_shmem_pmdmapped 0
nr_file_hugepages 0
nr_file_pmdmapped 0
nr_anon_transparent_hugepages 0
nr_vmscan_write 0
nr_vmscan_immediate_reclaim 0
nr_dirtied 90026
nr_written 86985
nr_throttled_written 0
nr_kernel_misc_reclaimable 0
nr_foll_pin_acquired 2227
nr_foll_pin_released 2227
nr_kernel_stack 19728
nr_page_table_pages 14783
nr_sec_page_table_pages 514
nr_iommu_pages 514
nr_swapcached 0
pgpromote_success 0
pgpromote_candidate 0
pgpromote_candidate_nrl 0
pgdemote_kswapd 0
pgdemote_direct 0
pgdemote_khugepaged 0
pgdemote_proactive 0
nr_hugetlb 0
nr_balloon_pages 0
nr_kernel_file_pages 0
nr_dirty_threshold 142858
nr_dirty_background_threshold 71341
nr_memmap_pages 0
nr_memmap_boot_pages 32256
pgpgin 1741205
pgpgout 442099
pswpin 0
pswpout 0
pgalloc_dma 257
pgalloc_dma32 2440068
pgalloc_normal 6392058
pgalloc_movable 0
pgalloc_device 0
allocstall_dma 0
allocstall_dma32 0
allocstall_normal 0
allocstall_movable 0
allocstall_device 0
pgskip_dma 0
pgskip_dma32 0
pgskip_normal 0
pgskip_movable 0
pgskip_device 0
pgfree 8961237
pgactivate 0
pgdeactivate 0
pglazyfree 300931
pgfault 6012900
pgmajfault 12781
pglazyfreed 0
pgrefill 0
pgreuse 277645
pgsteal_kswapd 0
pgsteal_direct 0
pgsteal_khugepaged 0
pgsteal_proactive 0
pgscan_kswapd 0
pgscan_direct 0
pgscan_khugepaged 0
pgscan_proactive 0
pgscan_direct_throttle 0
pgscan_anon 0
pgscan_file 0
pgsteal_anon 0
pgsteal_file 0
zone_reclaim_success 0
zone_reclaim_failed 0
pginodesteal 0
slabs_scanned 0
kswapd_inodesteal 0
kswapd_low_wmark_hit_quickly 0
kswapd_high_wmark_hit_quickly 0
pageoutrun 0
pgrotated 4
drop_pagecache 0
drop_slab 0
oom_kill 0
numa_pte_updates 0
numa_huge_pte_updates 0
numa_hint_faults 0
numa_hint_faults_local 0
numa_pages_migrated 0
pgmigrate_success 0
pgmigrate_fail 0
thp_migration_success 0
thp_migration_fail 0
thp_migration_split 0
compact_migrate_scanned 0
compact_free_scanned 0
compact_isolated 0
compact_stall 0
compact_fail 0
compact_success 0
compact_daemon_wake 0
compact_daemon_migrate_scanned 0
compact_daemon_free_scanned 0
htlb_buddy_alloc_success 0
htlb_buddy_alloc_fail 0
cma_alloc_success 0
cma_alloc_fail 0
unevictable_pgs_culled 1551966
unevictable_pgs_scanned 1352146
unevictable_pgs_rescued 1356318
unevictable_pgs_mlocked 4201
unevictable_pgs_munlocked 4172
unevictable_pgs_cleared 0
unevictable_pgs_stranded 0
thp_fault_alloc 0
thp_fault_fallback 0
thp_fault_fallback_charge 0
thp_collapse_alloc 0
thp_collapse_alloc_failed 0
thp_file_alloc 2704
thp_file_fallback 0
thp_file_fallback_charge 0
thp_file_mapped 0
thp_split_page 0
thp_split_page_failed 0
thp_deferred_split_page 0
thp_underused_split_page 0
thp_split_pmd 0
thp_scan_exceed_none_pte 0
thp_scan_exceed_swap_pte 0
thp_scan_exceed_share_pte 0
thp_split_pud 0
thp_zero_page_alloc 0
thp_zero_page_alloc_failed 0
thp_swpout 0
thp_swpout_fallback 0
balloon_inflate 0
balloon_deflate 0
balloon_migrate 0
swap_ra 0
swap_ra_hit 0
swpin_zero 0
swpout_zero 0
ksm_swpin_copy 0
cow_ksm 0
zswpin 0
zswpout 0
zswpwb 0
direct_map_level2_splits 152
direct_map_level3_splits 0
direct_map_level2_collapses 0
direct_map_level3_collapses 0
nr_unstable 0
EOF
fi

if [ ! -f "/data/data/com.termux/files/usr/bin/debian-mate" ]; then
cat << "EOF" > /data/data/com.termux/files/usr/bin/debian-mate
#!/bin/bash
root="/data/data/com.termux/files/home/pd-21/debian-mate"
kernelrelease="6.19.13-1004200828"
kernelversion="#1 SMP PREEMPT_DYNAMIC Fri Apr 10 04:52:00 WIB 2026"

unset LD_PRELOAD

command=(
  proot
  --kill-on-exit
  --link2symlink
  -0
  -r "${root}/debian"
)

if [ -n "$(ls -A "${root}/binds" 2>/dev/null)" ]; then
  for f in "${root}/binds"/*; do
    . "$f"
  done
fi

command+=(
  -k "\\Linux\\$(hostname)\\$kernelrelease\\$kernelversion\\$(uname -m)\\localdomain\\-1\\"
  -b /dev
  -b /proc
  -b /sys
  -b "${root}/debian:/dev/shm"
  -b /proc/self/fd/2:/dev/stderr
  -b /proc/self/fd/1:/dev/stdout
  -b /proc/self/fd/0:/dev/stdin
  -b /dev/urandom:/dev/random
  -b /proc/self/fd:/dev/fd
  -b "${root}/debian/proc/fakethings/stat:/proc/stat"
  -b "${root}/debian/proc/fakethings/vmstat:/proc/vmstat"
  -b "${root}/debian/proc/fakethings/version:/proc/version"
  # uncomment the following line to have access to the home directory of termux
  #-b /data/data/com.termux/files/home:/root/termux-home
  # uncomment the following line to the home sdcard
  #-b /sdcard:/root/sdcard
  -w /root
  /usr/bin/env -i
  MOZ_FAKE_NO_SANDBOX=1
  HOME=/root
  PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games
  TERM="$TERM"
  LANG=C.UTF-8
  /bin/bash --login
)

if [ -z "$1" ]; then
  exec "${command[@]}"
else
  exec "${command[@]}" -c "$@"
fi
EOF
fi

# chmod +x /data/data/com.termux/files/home/pd-21/debian-mate/debian/root/.bash_profile
echo "127.0.0.1 localhost localhost" > /data/data/com.termux/files/home/pd-21/debian-mate/debian/etc/hosts
echo "nameserver 1.1.1.1" > /data/data/com.termux/files/home/pd-21/debian-mate/debian/etc/resolv.conf
chmod +x /data/data/com.termux/files/home/pd-21/debian-mate/debian/etc/resolv.conf
termux-fix-shebang /data/data/com.termux/files/usr/bin/debian-mate
chmod +x /data/data/com.termux/files/usr/bin/debian-mate

# setup desktop
debian-mate 'apt update && apt install wget -y'

debian-mate 'wget https://raw.githubusercontent.com/arfshl/proot-distro-desktop/refs/heads/main/debian/mate/install.sh -O install.sh && chmod +x install.sh && ./install.sh'

echo 'To start command line session: debian-mate'
echo 'To start VNC server: startvnc'
echo 'To stop VNC server: stopvnc'
echo 'To restart VNC server: restartvnc'
echo 'Default user: debian-mate'
echo 'Default password: 123'    
echo 'VNC server address: 127.0.0.1:5900'
echo 'Default VNC password: 1234567890'
echo "Installation Complete!"
rm -- "$0"