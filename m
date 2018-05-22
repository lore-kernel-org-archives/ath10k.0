Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.nic.cz ([217.31.204.67])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL6pp-00022C-Gn
 for ath10k@lists.infradead.org; Tue, 22 May 2018 12:56:16 +0000
Date: Tue, 22 May 2018 14:55:40 +0200
From: Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Subject: qca6174 SDIO status?
Message-ID: <20180522145540.0de2dc2d@dellmb.labs.office.nic.cz>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/RM7mqq_loogr0QqdD/MDH/4"
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adam Porter <porter.adam@gmail.com>
Cc: ath10k@lists.infradead.org

--MP_/RM7mqq_loogr0QqdD/MDH/4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Adam,

have you solved the "crashing after few days" problem with ath10k on
QCA6174 via SDIO?

I am currently trying the ath10k-pending-sdio-usb, but it seems there
are some problems with the firmware, see attachment.

Please let me know if you have any idea what might be the problem and
also if you have succeeded with this module on ath10k. Thanks.

Marek 
--MP_/RM7mqq_loogr0QqdD/MDH/4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=qca6174_ath10k.txt

[   10.971251] ath10k_sdio mmc0:0001:1: WARNING: ath10k SDIO support is experimental
[   11.002943] ath10k_sdio mmc0:0001:1: Direct firmware load for ath10k/pre-cal-sdio-mmc0:0001:1.bin failed with error -2
[   11.013986] ath10k_sdio mmc0:0001:1: Direct firmware load for ath10k/cal-sdio-mmc0:0001:1.bin failed with error -2
[   11.024820] ath10k_sdio mmc0:0001:1: Direct firmware load for ath10k/QCA6174/hw3.0/firmware-sdio-6.bin failed with error -2
[   11.068860] ath10k_sdio mmc0:0001:1: qca6174 hw3.2 sdio target 0x05030000 chip_id 0x00000000 sub 0000:0000
[   11.078900] ath10k_sdio mmc0:0001:1: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[   11.088954] ath10k_sdio mmc0:0001:1: firmware ver  api 5 features ignore-otp crc32 44e248cf
[   11.247593] ath10k_sdio mmc0:0001:1: Direct firmware load for ath10k/QCA6174/hw3.0/board-2.bin failed with error -2
[   11.265478] ath10k_sdio mmc0:0001:1: board_file api 1 bmi_id N/A crc32 062aa547
[   14.908163] ath10k_sdio mmc0:0001:1: failed to ping firmware: -110
[   14.916183] ath10k_sdio mmc0:0001:1: failed to reset rx filter: -110
[   14.922792] ath10k_sdio mmc0:0001:1: could not init core (-110)
[   14.928903] ath10k_sdio mmc0:0001:1: could not probe fw (-110)

--MP_/RM7mqq_loogr0QqdD/MDH/4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--MP_/RM7mqq_loogr0QqdD/MDH/4--
