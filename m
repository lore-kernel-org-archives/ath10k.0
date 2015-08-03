Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMKkB-0000kK-JF
 for ath10k@lists.infradead.org; Mon, 03 Aug 2015 18:45:52 +0000
Received: by vkca124 with SMTP id a124so45723621vkc.1
 for <ath10k@lists.infradead.org>; Mon, 03 Aug 2015 11:45:29 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 3 Aug 2015 14:45:29 -0400
Message-ID: <CALiJtcqant1xGJTPpMpHj+zVAcY7gfN8UXy30sAdSd9QvsPJ1Q@mail.gmail.com>
Subject: qca6164 support
From: vvanpo <vvanpo@gmail.com>
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

Hi,

I just got a Lenovo Yoga 3 11, only to find the wireless doesn't work.

The PCI id is 168c:0041:17aa:3545
I downloaded the driver (version 12.0.0.102, date 06/24/2015) from the
Lenovo website and extracted it in Wine (as I saw someone else do from
another thread), which resulted in the following bin files:
eeprom_ar6320_2p1_NFA324i_5.bin
eeprom_ar6320_2p1_NFA344i.bin
eeprom_ar6320_2p1_NFA344i_highTX.bin
eeprom_ar6320_2p1_NFA345i.bin
eeprom_ar6320_2p1_NFA345i_highTX.bin
eeprom_ar6320_2p1_NFA354xp.bin
eeprom_ar6320_2p1_NFA355i.bin
qca61x4_1_1_2.bin

In the netathr10x.inf file, my device and subsystem ids correspond to
section 'ATHR_DEV_OS63_988x_LE_NFA345_IPG.ndi', although I'm not sure
how that relates to which bin file and what a 'section' is exactly.  I
chose to use the NFA345i.bin file, which I symlinked
    /lib/firmware/ath10k/QCA6174/hw2.1/board-pci-168c:0041:17aa:3545.bin
to.

I used dissect.py/assemble.py to create firmware-5.bin:
    ./dissect.py < qca61x4_1_1_2.bin
    ./assemble.py atheros-12.0.0.102-fw 0 fw-2.bin fw-1.bin 4 > firmware-5.bin

I enabled skip_otp=y.
I compiled master at github.com/kvalo/ath, but with the modification
    #define QCA6174_2_1_DEVICE_ID   (0x0041)
so it would recognize my card.

On loading the ath10k_pci module I get a 'firmware crashed!' message,
and a firmware dump.  Sometimes the dump itself must print garbage to
dmesg and turns my terminal into mojibake, which I think has to do
with the features string as here:
http://lists.infradead.org/pipermail/ath10k/2015-July/005703.html

As you can probably tell I'm haphazardly shooting in the dark without
much knowledge of whats actually going on.  Is there a way I can
meaningfully contribute, or am I at the mercy of those with access to
documentation on how the qualcomm firmware works?
  Some questions:
  - when ath10k_print_driver_info gets called, my ar->chip_id is
printed as 0x003405ff, which should correspond to
QCA6174_HW_2_2_CHIP_ID_REV when masked (like in
ath10k_pci_get_num_banks).  So why is it still referred to as hw2.1
(instead of hw2.2), and what do these revisions signify, anyway?
  - how can I be sure I'm using the correct bin files, and is there
any documentation on the format of these files?
  - what would need to be changed to add support for qca6164 in ath10k?

Thanks,
Victor

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
