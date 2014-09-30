Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYqel-0002CA-AC
 for ath10k@lists.infradead.org; Tue, 30 Sep 2014 06:11:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: checkpatch: long help string
Date: Tue, 30 Sep 2014 09:10:53 +0300
Message-ID: <8738b9y6xe.fsf@kamboji.qca.qualcomm.com>
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
To: Joe Perches <joe@perches.com>
Cc: ath10k@lists.infradead.org

Hi Joe,

another checkpatch question. I have this warning in ath10k:

drivers/net/wireless/ath/ath10k/debug.c:656: WARNING: line over 83 characters

And it comes from this help string:

	const char buf[] =
		"To simulate firmware crash write one of the keywords to this file:\n"
		"`soft` - this will send WMI_FORCE_FW_HANG_ASSERT to firmware if FW supports that command.\n"
		"`hard` - this will send to firmware command with illegal parameters causing firmware crash.\n"
		"`assert` - this will send special illegal parameter to firmware to cause assert failure and crash.\n";

https://github.com/kvalo/ath/blob/ath-next/drivers/net/wireless/ath/ath10k/debug.c#L652

Any recommendations how to handle that?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
