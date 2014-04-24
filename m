Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x235.google.com ([2607:f8b0:400c:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdFMc-00017o-HO
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 08:50:38 +0000
Received: by mail-ve0-f181.google.com with SMTP id oy12so2492017veb.26
 for <ath10k@lists.infradead.org>; Thu, 24 Apr 2014 01:50:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkBCGyKYDaOMgdCi4Yw+SXeuRS+t0rGE8o=8+x2q5N74w@mail.gmail.com>
References: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
 <CA+BoTQkBCGyKYDaOMgdCi4Yw+SXeuRS+t0rGE8o=8+x2q5N74w@mail.gmail.com>
Date: Thu, 24 Apr 2014 16:50:15 +0800
Message-ID: <CAEFj986fsmUD2kvEN=vjHK32cunyFO+8bH-y7ZoWZAMkcunJ2w@mail.gmail.com>
Subject: Re: [PATCH] ath10k: don't allow stand alone monitor mode for non-AP
 firmware
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> I think Monitor operation should be performed on a best effort basis.
> This means monitor_start/stop should be attempted once number of
> non-monitor vdevs changes.

I am too clear about this. Do you mean that actually we can have
monitor mode on non-monitor vdevs in firmware 636?

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
