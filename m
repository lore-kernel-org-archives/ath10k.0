Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from edge10.ethz.ch ([82.130.75.186])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YrsaU-00054N-1C
 for ath10k@lists.infradead.org; Mon, 11 May 2015 18:37:59 +0000
From: "Costa Molero  Edgar" <cedgar@student.ethz.ch>
Subject: CT firmware crashes randomly 
Date: Mon, 11 May 2015 18:37:31 +0000
Message-ID: <BB63CF2605733841BD56CD9C38AC1F7E2396567F@MBX13.d.ethz.ch>
Content-Language: ca-ES
MIME-Version: 1.0
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

I am running some tests using a wle900vx nic, and the commercial firmware CT 10.4.467-ct-com-full-013-b5b14. 

For the tests I am modifying the transmission rates and number of spatial streams I use. MCS 0-9, SS 1-3 ("iw wlanX set bitrates legacy-5 ht-mcs-5 vht-mcs-5 x:y). 
Every time I modify the transmission rate I disconnect and connect from the Access Point. Then I found that if I want to reset the values of "fw_stats" file I need to reload the firmware, or I can do a (echo "hw-restart" > simulate_fw_crash). 

The test should take around 4-6h but some times randomly the script I am running is not able to set bit rates anymore. (-22 error). When this happen the script tries to reload the ath10k driver (modprobe -r ath10k + modprobe ath10k). But after that I can not connect to the access point anymore until I reboot the computer.  Could it be because I do "hw-restart" too many times?. 

 
Here a slice of dmesg : at the end you will see that I restart it several times. (However, in the part you can not see I was doing the same as well)

[   17.248265] ath10k_pci 0000:0c:00.0: irq 43 for MSI/MSI-X
[   17.248297] ath10k_pci 0000:0c:00.0: pci irq msi interrupts 1 irq_mode 0 reset_mode 0
[   17.945015] ath10k_pci 0000:0c:00.0: Direct firmware load failed with error -2
[   17.945020] ath10k_pci 0000:0c:00.0: Falling back to user helper
[   18.243890] ath10k_pci 0000:0c:00.0: Direct firmware load failed with error -2
[   18.243899] ath10k_pci 0000:0c:00.0: Falling back to user helper
[   18.244959] ath10k_pci 0000:0c:00.0: could not fetch firmware file 'ath10k/QCA988X/hw2.0/firmware-4.bin': -12
[   18.244999] ath10k_pci 0000:0c:00.0: Direct firmware load failed with error -2
[   18.245003] ath10k_pci 0000:0c:00.0: Falling back to user helper
[   18.246260] ath10k_pci 0000:0c:00.0: could not fetch firmware file 'ath10k/QCA988X/hw2.0/firmware-3.bin': -12
[   19.444502] ath10k_pci 0000:0c:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 10.1.467-ct-com-full-013-b5b14a api 2 htt 2.1 wmi 2 cal otp max_sta 128
[   19.444509] ath10k_pci 0000:0c:00.0: debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
[  149.913555] ath10k_pci 0000:0c:00.0: user requested hw restart
[  151.026791] ath10k_pci 0000:0c:00.0: device successfully recovered
[  154.925661] WARNING: CPU: 0 PID: 2365 at /home/wimo/backports_kernel3.16/backports-4.0.1-1/drivers/net/wireless/ath/ath10k/htt_rx.c:968 ath10k_htt_rx_h_mpdu.isra.39+0x699/0x710 [ath10k_core]()
[  154.925665] Modules linked in: rfcomm bnep bluetooth 6lowpan_iphc arc4 carl9170(OE) dell_wmi sparse_keymap gpio_ich ath10k_pci(OE) dell_laptop pcmcia ath10k_core(OE) coretemp dcdbas kvm ath(OE) mac80211(OE) joydev yenta_socket serio_raw pcmcia_rsrc pcmcia_core cfg80211(OE) compat(OE) wmi snd_hda_codec_idt snd_hda_codec_generic mac_hid i915 drm_kms_helper irda crc_ccitt snd_hda_intel drm snd_hda_controller snd_hda_codec snd_hwdep snd_pcm snd_seq_midi snd_seq_midi_event lpc_ich video snd_rawmidi i2c_algo_bit snd_seq snd_seq_device snd_timer snd soundcore shpchp parport_pc ppdev lp parport psmouse firewire_ohci b44 firewire_core crc_itu_t ssb pata_acpi mii
[  154.925844]  [<ffffffffc0852b69>] ath10k_htt_rx_h_mpdu.isra.39+0x699/0x710 [ath10k_core]
[  154.925865]  [<ffffffffc08533ff>] ? ath10k_htt_rx_h_ppdu+0x1ef/0x240 [ath10k_core]
[  154.925879]  [<ffffffffc0854051>] ath10k_htt_txrx_compl_task+0x391/0xde0 [ath10k_core]
[  155.044138] ath10k_pci 0000:0c:00.0: rx ring became corrupted: -5
[  194.992183] ath10k_pci 0000:0c:00.0: user requested hw restart
[  196.110865] ath10k_pci 0000:0c:00.0: device successfully recovered
[  240.092903] ath10k_pci 0000:0c:00.0: user requested hw restart
[  241.206779] ath10k_pci 0000:0c:00.0: device successfully recovered
[  285.120599] ath10k_pci 0000:0c:00.0: user requested hw restart
[  286.238637] ath10k_pci 0000:0c:00.0: device successfully recovered
[  330.223594] ath10k_pci 0000:0c:00.0: user requested hw restart
[  331.339252] ath10k_pci 0000:0c:00.0: device successfully recovered
[  375.244670] ath10k_pci 0000:0c:00.0: user requested hw restart
[  376.358469] ath10k_pci 0000:0c:00.0: device successfully recovered
[  420.257809] ath10k_pci 0000:0c:00.0: user requested hw restart
[  421.366862] ath10k_pci 0000:0c:00.0: device successfully recovered
[  465.282230] ath10k_pci 0000:0c:00.0: user requested hw restart
[  466.394279] ath10k_pci 0000:0c:00.0: device successfully recovered
[  510.444608] ath10k_pci 0000:0c:00.0: user requested hw restart
[  511.554408] ath10k_pci 0000:0c:00.0: device successfully recovered
[  555.498328] ath10k_pci 0000:0c:00.0: user requested hw restart
[  556.614331] ath10k_pci 0000:0c:00.0: device successfully recovered

Edgar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
