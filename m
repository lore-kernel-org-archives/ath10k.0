Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIYtD-0005mL-Hf
 for ath10k@lists.infradead.org; Thu, 30 Jun 2016 10:08:08 +0000
Message-ID: <1467281260.2499.4.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: fix fq lockdep warnings
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 30 Jun 2016 12:07:40 +0200
In-Reply-To: <1467201634-11060-1-git-send-email-michal.kazior@tieto.com>
 (sfid-20160629_135849_174305_00E9FE0A)
References: <1467026569-19329-1-git-send-email-michal.kazior@tieto.com>
 <1467201634-11060-1-git-send-email-michal.kazior@tieto.com>
 (sfid-20160629_135849_174305_00E9FE0A)
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Wed, 2016-06-29 at 14:00 +0200, Michal Kazior wrote:
> Some lockdep assertions were not fulfilled and
> resulted in a kernel warning/call trace if driver
> used intermediate software queues (e.g. ath10k).
> 
> Existing code sequences should've guranteed safety
> but it's always good to be extra careful.
> 
Applied.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
