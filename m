Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIpvb-0006RB-Fe
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 01:38:24 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s1R1bxPk021465
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Wed, 26 Feb 2014 17:38:00 -0800
Message-ID: <530E96F7.5010706@candelatech.com>
Date: Wed, 26 Feb 2014 17:37:59 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: AP crashes, stock .467 firmware, latest 3.14.0-rc4.
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>

I'm using stock ath10k kernel and firmware on my AP machine.  NIC is WLE900VX.

It ran OK for a while, then the firmware died somehow (but not with
a normal crash or assert it seems), and it could not recover.

[root@ath10k-2220 wifi]# dmesg|grep ath10k
[    4.845629] systemd[1]: Set hostname to <ath10k-2220>.
[    6.520684] ath10k_pci 0000:03:00.0: BAR 0: assigned [mem 0xfb800000-0xfb9fffff 64bit]
[    6.744537] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[    6.796097] ath10k: pci irq MSI
[    7.711187] ath10k: qca988x hw2.0 (0x4100016c) fw 10.1.467.1-1 api 2 htt 2.1
[   28.772368] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[   30.496704] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[   32.260240] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[   33.995212] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[   35.881922] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[   37.985434] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[  375.734365] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[  377.165553] ath10k: peer-unmap-event: unknown peer id 2
[  377.839478] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[  379.645717] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[  381.455875] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[  383.192019] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[  384.946171] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[  386.874341] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[  388.980532] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[  391.882779] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 2809.636784] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 2811.435935] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 2813.172085] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 2814.928240] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 2817.002433] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 2819.161630] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 2821.320823] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3048.904577] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3050.722743] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3052.456896] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3054.213058] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3056.290248] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3058.448449] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3060.505693] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3423.723713] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3425.543944] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3427.278034] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3429.034190] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3431.048373] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3433.206576] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 3435.373769] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4071.499689] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4073.321857] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4075.057006] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4076.813163] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4078.886353] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4081.046554] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4083.204743] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4183.417866] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4185.239036] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4186.975182] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4188.729340] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4190.804530] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4192.963730] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4195.121923] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4315.345856] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4316.777078] ath10k: peer-unmap-event: unknown peer id 2
[ 4317.450046] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4341.533248] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4343.356412] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4345.092570] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4346.846715] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4348.712893] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4350.873090] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[ 4353.037287] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[11128.876621] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[11130.307837] ath10k: peer-unmap-event: unknown peer id 2
[11130.980813] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[11155.831080] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[11157.652244] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[11159.388391] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[11161.142536] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[11163.258741] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[11165.172921] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[11167.339113] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[13312.588324] ath10k: SWBA overrun on vdev 0
[13312.834111] ath10k: SWBA overrun on vdev 0
[13313.079896] ath10k: SWBA overrun on vdev 0
[13313.325654] ath10k: SWBA overrun on vdev 0
[13313.571470] ath10k: SWBA overrun on vdev 0
[13313.817250] ath10k: SWBA overrun on vdev 0
[13314.063042] ath10k: SWBA overrun on vdev 0
[13314.308827] ath10k: SWBA overrun on vdev 0
[13314.554615] ath10k: SWBA overrun on vdev 0
[13314.800403] ath10k: SWBA overrun on vdev 0
[13315.152909] Modules linked in: iptable_raw xt_CT nf_nat_ipv4 nf_nat 8021q garp stp mrp llc fuse macvlan pktgen ip6table_filter ip6_tables ebtable_nat
ebtables nfsv3 nfs_acl rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs lockd sunrpc fscache snd_hda_codec_realtek uinput pcspkr snd_hda_codec_generic ath9k
coretemp ath9k_common hwmon ath10k_pci ath9k_hw ath10k_core intel_powerclamp ath e1000e mac80211 kvm snd_hda_intel snd_hda_codec joydev gpio_ich snd_hwdep
cfg80211 ptp iTCO_wdt pps_core iTCO_vendor_support ppdev shpchp microcode serio_raw parport_pc parport i2c_i801 lpc_ich snd_seq snd_seq_device snd_pcm snd_timer
snd soundcore ipv6 i915 i2c_algo_bit drm_kms_helper ata_generic pata_acpi drm i2c_core video [last unloaded: iptable_nat]
[13317.995706] ath10k: SWBA overrun on vdev 0
[13318.153147] ath10k: wmi mgmt_tx failed (-11)
[13318.241428] ath10k: SWBA overrun on vdev 0
[13318.487222] ath10k: SWBA overrun on vdev 0
[13318.733005] ath10k: SWBA overrun on vdev 0
[13318.978792] ath10k: SWBA overrun on vdev 0
[13319.224585] ath10k: SWBA overrun on vdev 0
[13319.470370] ath10k: SWBA overrun on vdev 0
[13319.716159] ath10k: SWBA overrun on vdev 0
[13319.961946] ath10k: SWBA overrun on vdev 0
[15656.882486] ath10k: Failed to delete peer: 00:0e:8e:44:07:32 for VDEV: 0
[17269.005042] ath10k: removing stale peer 00:0e:8e:44:07:32 from vdev_id 0
[17270.005182] ath10k: suspend timed out - target pause event never came
[17270.677420] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[17272.108800] ath10k: peer-unmap-event: unknown peer id 2
[17272.782614] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[17424.021355] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[17425.840552] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[17427.578668] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[17430.579836] ath10k: target stalled
[17430.581955] ath10k: failed to wait for target to init: -5
[17430.809787] ath10k: failed to power up target using warm reset (-5), trying cold reset
[17430.882834] ath10k: target took longer 5000 us to wake up (awake count 1)
[17430.882926] ath10k_pci 0000:03:00.0: irq 53 for MSI/MSI-X
[17430.894967] ath10k: Failed to get pcie state addr: -16
[17430.898825] ath10k: failed to setup init config: -16
[17430.902523] ath10k: device crashed - no diagnostics available
[17430.907672] ath10k: target took longer 5000 us to wake up (awake count 2)
[17430.907673] ath10k: failed to wake up target: -110
[17430.911181] ath10k: failed to power up target using cold reset too (-16)
[17430.916609] ath10k: could not init hif (-16)
[17430.943494] ath10k: target took longer 5000 us to wake up (awake count 2)
[17430.943498] ath10k: failed to wake up target: -110
[17430.947028] ath10k: failed to reset target: -110
[17430.950434] ath10k: failed to power up target using warm reset (-110), trying cold reset
[17430.955564] ath10k: target took longer 5000 us to wake up (awake count 3)
[17430.955566] ath10k: failed to wake up target: -110
[17430.959073] ath10k: failed to reset target: -110
[17430.962410] ath10k: failed to power up target using cold reset too (-110)
[17430.967924] ath10k: could not init hif (-110)
[17430.983345] ath10k: target took longer 5000 us to wake up (awake count 4)
[17430.983347] ath10k: failed to wake up target: -110
[17430.986863] ath10k: failed to reset target: -110
[17430.990201] ath10k: failed to power up target using warm reset (-110), trying cold reset
[17430.995374] ath10k: target took longer 5000 us to wake up (awake count 5)
[17430.995376] ath10k: failed to wake up target: -110
[17430.998890] ath10k: failed to reset target: -110
[17431.002228] ath10k: failed to power up target using cold reset too (-110)
[17431.007741] ath10k: could not init hif (-110)
[17431.055870] ath10k: failed to wake up target: -110
[17431.059401] ath10k: failed to reset target: -110
[17431.067869] ath10k: failed to wake up target: -110
[17431.071417] ath10k: failed to reset target: -110
[17431.074756] ath10k: failed to power up target using cold reset too (-110)
[17431.080271] ath10k: could not init hif (-110)
[17431.144189] ath10k: failed to wake up target: -110
[17431.147720] ath10k: failed to reset target: -110
[17431.156182] ath10k: failed to wake up target: -110
[17431.159691] ath10k: failed to reset target: -110
[17431.163032] ath10k: failed to power up target using cold reset too (-110)
[17431.168547] ath10k: could not init hif (-110)
[17431.519518] ath10k: failed to wake up target: -110
[17431.523051] ath10k: failed to reset target: -110
[17431.531595] ath10k: failed to wake up target: -110
[17431.535103] ath10k: failed to reset target: -110
[17431.538442] ath10k: failed to power up target using cold reset too (-110)
[17431.543956] ath10k: could not init hif (-110)
[17432.537746] ath10k: failed to wake up target: -110
[17432.541269] ath10k: failed to reset target: -110
[17432.549767] ath10k: failed to wake up target: -110
[17432.553275] ath10k: failed to reset target: -110
[17432.556606] ath10k: failed to power up target using cold reset too (-110)
[17432.562116] ath10k: could not init hif (-110)
[17433.950250] ath10k: failed to wake up target: -110
[17433.954681] ath10k: failed to reset target: -110
[17433.964052] ath10k: failed to wake up target: -110
[17433.968428] ath10k: failed to reset target: -110
[17433.972613] ath10k: failed to power up target using cold reset too (-110)
[17433.978995] ath10k: could not init hif (-110)
[17441.187157] ath10k: target took longer 5000 us to wake up (awake count 16)
[17441.187158] ath10k: failed to wake up target: -110
[17441.191624] ath10k: failed to reset target: -110
[17441.195878] ath10k: failed to power up target using warm reset (-110), trying cold reset
[17441.201006] ath10k: target took longer 5000 us to wake up (awake count 17)
[17441.201007] ath10k: failed to wake up target: -110
[17441.205378] ath10k: failed to reset target: -110
[17441.209592] ath10k: failed to power up target using cold reset too (-110)
[17441.215982] ath10k: could not init hif (-110)
[17447.753605] ath10k: target took longer 5000 us to wake up (awake count 18)
[17447.753608] ath10k: failed to wake up target: -110
[17447.758029] ath10k: failed to reset target: -110
[17447.762268] ath10k: failed to power up target using warm reset (-110), trying cold reset
[17447.767396] ath10k: target took longer 5000 us to wake up (awake count 19)
[17447.767398] ath10k: failed to wake up target: -110
[17447.771792] ath10k: failed to reset target: -110
[17447.775988] ath10k: failed to power up target using cold reset too (-110)
[17447.782374] ath10k: could not init hif (-110)
[17454.324764] ath10k: target took longer 5000 us to wake up (awake count 20)
[17454.324782] ath10k: failed to wake up target: -110
[17454.329196] ath10k: failed to reset target: -110
[17454.333416] ath10k: failed to power up target using warm reset (-110), trying cold reset
[17454.338546] ath10k: target took longer 5000 us to wake up (awake count 21)
[17454.338547] ath10k: failed to wake up target: -110
[17454.342938] ath10k: failed to reset target: -110
[17454.347145] ath10k: failed to power up target using cold reset too (-110)
[17454.353543] ath10k: could not init hif (-110)
[17461.125145] ath10k: target took longer 5000 us to wake up (awake count 22)
[17461.125148] ath10k: failed to wake up target: -110
[17461.129560] ath10k: failed to reset target: -110
...and lots more of the same.


Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
