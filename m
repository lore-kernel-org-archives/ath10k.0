Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQcLS-0008Dy-JZ
 for ath10k@lists.infradead.org; Tue, 14 May 2019 18:40:11 +0000
Message-ID: <8eacb8e107c854b64a0c6116fca9731ddd99dcac.camel@sipsolutions.net>
Subject: Re: [PATCH v2] mac80211: remove warning message
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 14 May 2019 20:40:03 +0200
In-Reply-To: <4d013893-3302-14f0-c957-b3771f4b6b82@candelatech.com>
References: <1557824507-17668-1-git-send-email-yiboz@codeaurora.org>
 <7c92f5cf51eaec1d5449698d90f5b6c5ca6c2bea.camel@sipsolutions.net>
 <ccb48284f0d96e72f4c041e12c943f0a@codeaurora.org>
 <e2a6596b99085541a5886c0d0d6393c849ac2d57.camel@sipsolutions.net>
 <34f72d5db336b9898618bf1c5c15ec41094d7d06.camel@perches.com>
 <4d013893-3302-14f0-c957-b3771f4b6b82@candelatech.com>
Mime-Version: 1.0
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
To: Ben Greear <greearb@candelatech.com>, Joe Perches <joe@perches.com>, Yibo Zhao <yiboz@codeaurora.org>
Cc: Zhi Chen <zhichen@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org


> We know the WARN hits, we have the backtrace, and it is easy enough (in my setup
> at least) to reproduce this.  So, the WARN logic has done its job.
> 
> Having more of these spam the kernel doesn't add much benefit I think.

Well, this doesn't necessarily just catch a *single* issue, so it should
remain for the future, I'd think.

> Anyone have any suggestions on how to fix the underlying issue?

I don't even have the backtrace and scenario that causes it.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
