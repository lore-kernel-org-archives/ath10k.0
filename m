Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x236.google.com ([2607:f8b0:400c:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQaMe-0002fR-BW
 for ath10k@lists.infradead.org; Thu, 20 Mar 2014 10:38:20 +0000
Received: by mail-ve0-f182.google.com with SMTP id jw12so676638veb.41
 for <ath10k@lists.infradead.org>; Thu, 20 Mar 2014 03:37:59 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 20 Mar 2014 18:37:58 +0800
Message-ID: <CAEFj984L2PiS9isotB1VA=yz3H+tR9kqnWfF9HLXRm5jdTLd=w@mail.gmail.com>
Subject: FW Rate Control is not working for Adhoc Mode
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>

Hi, all

FW rate control only works on legacy rate and not HT rate for adhoc
mode. So I am wonder where should I look into to solve this problem.

I have try to play around with WMI_PEER_RATE_RETRY_SCHED_CMDID by
calling the command with vdev_id and peer mac addr. But no luck, it
won't work.

Anyone has any clue on this?

Regards,
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
