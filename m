Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZdFy-0003SZ-Nm
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 11:09:39 +0000
Received: by igcrk20 with SMTP id rk20so96994026igc.1
 for <ath10k@lists.infradead.org>; Wed, 09 Sep 2015 04:09:17 -0700 (PDT)
Date: Wed, 9 Sep 2015 07:08:55 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH 3/3] ath10k: implement mesh support
Message-ID: <20150909110855.GA27466@localhost>
References: <1440673024-13696-1-git-send-email-me@bobcopeland.com>
 <1440673024-13696-4-git-send-email-me@bobcopeland.com>
 <87oahc9g9h.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87oahc9g9h.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Wed, Sep 09, 2015 at 10:57:30AM +0300, Kalle Valo wrote:
> I did a quick smoke test and saw the splat below. It's this warning from
> cfg80211:
> 
> 			/*
> 			 * Don't advertise an unsupported type
> 			 * in a combination.
> 			 */
> 			if (WARN_ON((wiphy->interface_modes & types) != types))
> 				return -EINVAL;
> 
> I didn't immeaditely figure out what's causing this, the interface types
> looked correct to me. Unfortunately I don't have time to investigate
> more at the moment, but will look later.

Doh!  Yeah this warning is exactly why I marked it supported even if you
couldn't use it due to missing rawmode support.   Obviously I missed one
of the cases, I'll take a look.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
