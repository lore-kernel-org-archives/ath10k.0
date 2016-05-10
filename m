Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from champagne.comp.nus.edu.sg ([137.132.80.90])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b00uC-0004Tt-4V
 for ath10k@lists.infradead.org; Tue, 10 May 2016 06:12:30 +0000
Received: from mail-io0-f197.google.com ([209.85.223.197])
 by champagne.comp.nus.edu.sg (Exim) with esmtps (TLSv1:RC4-SHA:128)
 id 1b00td-0007ur-5J
 for ath10k@lists.infradead.org; Tue, 10 May 2016 14:11:53 +0800
Received: by mail-io0-f197.google.com with SMTP id k129so12708513iof.0
 for <ath10k@lists.infradead.org>; Mon, 09 May 2016 23:11:53 -0700 (PDT)
MIME-Version: 1.0
From: Raj Joshi <rajjoshi@comp.nus.edu.sg>
Date: Tue, 10 May 2016 14:11:11 +0800
Message-ID: <CA+uUJGtXNAe=FRgYTVDNf6aNVE78CMSs+gLj-bQgA_=hFZibaA@mail.gmail.com>
Subject: Setting per-frame tx rate for frames injected in raw tx mode
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
To: ath10k@lists.infradead.org

Hi all,

For a research project, I need to inject frames in monitor mode and
have them sent out with rate settings as set in the radiotap header -
basically setting per-frame tx rate. I have tried doing so, but the
frame is transmitted at a basic rate with 802.11a instead of a VHT
rate as set in the radiotap. Following are the setup and methodology
details. Sorry about email length; but wanted to provide as much
relevant information.

---------------
Setup Info
---------------
* x86-64 board running Ubuntu 12.04.5 LTS
* Chipset: QCA9880 hw2.0 with 3 x 3 antennas
* Kernel: 3.8.0-29-generic x86_64
* Firmware: Initially QCA's 10.2.4.70.42-2 obtained via
https://github.com/kvalo/ath10k-firmware. After experiencing crashes,
later changed to one from CT (10.2.4.70-31-ct-xtW-003-3b0444c) | Both
the firmwares support raw-mode.
* ath10k: https://github.com/kvalo/ath (snapshot of commit
7de1931eec121045e4e35d0b519ce8bad9b10b51 | Wed Mar 23 14:27:35 2016
+0200)
 => backport generated using backports.git
(https://git.kernel.org/cgit/linux/kernel/git/backports/backports.git)
backports-20160122-0-ga91a3e6. Backporting was not clean; had to fix a
few compile errors due to missing files by manually copying those
files.

-------------------
Methodology
-------------------
* Setup up a hostapd 802.11ac AP on one of the boards with 80 MHz
channel width and correctly specified center frequencies.
* Setup monitor mode on another board for sniffing traffic on the same
80 MHz channel width.
* Connect an 802.11ac capable laptop (Windows/Ubuntu) and exchange
data frames with the AP | Capture them on the sniffer board (with all
the VHT info in radiotap) so that they could be used as reference to
construct injection frame.
* Now shutdown the AP and change the interface on the AP board to
monitor mode. Re-load ath10k_core with rawmode=1 and then ath10k_pci
as well. Inject one of the captured frame with radiotap VHT rate info
into the monitor interface and use the sniffer to check if it was
transmitted.
* The firmware (QCA 10.2.4.70.42-2) crashed in this case => couldn't
understand the firmware crash dump. Changed the firmware to CT
10.2.4.70-31-ct-xtW-003-3b0444c.
* Now the frame is transmitted and detected by the sniffer. However,
the radio information via radiotap shows that it was sent with a basic
rate of 802.11a.
* Tried for both encrypted (WPA2) and non-encrypted frames. Result is the same.

--------------------------------
Other Considerations
--------------------------------
* The raw tx patch: As suggested on the CT firmware page, I looked
into the so called "out-of-tree" raw tx patch
(http://comments.gmane.org/gmane.linux.drivers.ath10k.devel/246) and
tried to reconcile it with the current ath10k source. Apparently other
than changes to cmd_tx.len,  the suggested changes in the patch are
either already in place by use of 'txmode' variable or they are no
more relevant with the new source code. For my non-encrypted frame, I
got my custom ASCII string inside the frame correctly transmitted and
so I 'believe' the changes to cmd_tx.len are no more required due to
correct msdu->len. Thus, it seems that this patch is no more necessary
and that this patch has nothing to do with correct tx rate setting.
* QoS versus non-QoS: Both of my sample injection frames are QoS data
with radiotap on top of it. I couldn't find a way to disable QoS and
it seems that it is not required either as there is no length issue
anymore as was discussed in the raw tx patch discussion; my frame is
transmitted whole and correct.
* VHT Parsing in Radiotap: I have double checked that my
net/mac80211/tx.c has the relevant updated code wrt parsing of VHT
rate information
(https://github.com/kvalo/ath/commit/646e76bb5daf4ca38438c69ffb72cccb605f3466)
* Disabling A-MSDU: I didn't have to do this as I could resolve my
firmware crash by switching to the CT firmware.
* Using the ath10k master development branch: I also tried backporting
master of https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git,
but compilation of backported code failed due to lack of some methods
such as nla_put_net64, nla_put_be64, etc. in include/net/netlink.h of
my stock kernel headers (I believe). So I am not sure if things have
changed since the Mar 23 2016 snapshot of ath10k github repo and now
that rate is correctly set for VHT raw tx injection.

--------
Files
--------
* single udp encapsulating unencrypted frame
(https://www.dropbox.com/s/pqmjk2ayw6uwqiw/single_udp_unencrypted_frame.pcap?dl=0)
* single udp encapsulating encrypted frame
(https://www.dropbox.com/s/4zvgb7ls40v46zu/single_udp_encrypted_frame.pcap?dl=0)
Not sure if it is necessary to change the source MAC address to that
of your respective wlan card.

Any help in getting this thing to work is deeply appreciated.

Thanks,
Raj Joshi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
