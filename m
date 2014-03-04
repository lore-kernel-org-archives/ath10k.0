Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKoKN-0002BN-BR
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 12:20:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: ath10k-firmware.git change
Date: Tue, 4 Mar 2014 14:19:40 +0200
Message-ID: <87vbvuxijn.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org

Hi,

I did some changes in ath10k-firmware.git:

* I changed 10.1.467.2-1 as the default firmware as that's the firmware
  which is most tested. This is the version I'm also planning to submit
  to linux-firmware.git.

* I created main and 10.1 directories to hold images from respective
  firmware branches.

* I removed FW API 1 images firmware.bin and otp.bin altogether, we
  really do not want to support those anymore. Use FW API 2 files
  (=firmware-2.bin) instead.

https://github.com/kvalo/ath10k-firmware

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
