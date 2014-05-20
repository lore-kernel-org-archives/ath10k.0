Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-f178.google.com ([74.125.82.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmpOI-00048C-B1
 for ath10k@lists.infradead.org; Tue, 20 May 2014 19:08:00 +0000
Received: by mail-we0-f178.google.com with SMTP id u56so959528wes.23
 for <ath10k@lists.infradead.org>; Tue, 20 May 2014 12:07:34 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 20 May 2014 12:07:34 -0700
Message-ID: <CAJ+vNU3jF_GAEVETh1utpYgNGQ6_k=JwYZrsjvVoXDPpuhJdsA@mail.gmail.com>
Subject: ath10k rate control and stats
From: Tim Harvey <tharvey@gateworks.com>
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

Greetings,

I can't figure out how to get rate control stats to show me what MCS
rate my ath10k links are at. Is rate control implemented by the
firmware or part of the mac80211 rate control? Is there any way to get
stats akin to the per-station rc_stats I'm used to seeing with ath9k?

Thanks,

Tim

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
