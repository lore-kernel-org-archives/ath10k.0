Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 8 Sep 2016 21:31:12 +0200
Message-ID: <CAFBinCDnmEuSEKofHQy3SkKuewL+cjuxhibj7O71ASL0yfH_Ew@mail.gmail.com>
Subject: support for QCA9377 SDIO (ath10k or ath6kl)
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
To: ath10k@lists.infradead.org, ath6kl@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Hello,

is there any support for the SDIO chips QCA9377 (and QCA9378) planned?
Would these be supported by ath10k or ath6kl or is a completely new
driver needed?

Some background:
There are some device (Android TV boxes) which are using a QCA9377
wifi chip connected via SDIO. Example: Beelink GT1 (using an Amlogic
S912 SoC) - [0]

The part in question is labeled with AW-CM273SM (could be an AzureWave
module based on the name - but that is pure speculation).
According to some google hits it uses a QCA9377 chip (which would
match with the wifi-fw tarball from Amlogic which recently gained a
"qcom9377" folder).


Regards,
Martin


[0] http://forum.xda-developers.com/android-stick--console-computers/amlogic/beelink-gt1-amlogic-912-2-16gb-t3451068

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
