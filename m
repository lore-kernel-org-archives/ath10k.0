Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHCDr-0002Y3-S0
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 14:07:01 +0000
Message-ID: <1422626790.1919.22.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/7] ath10k: implement chanctx API
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 30 Jan 2015 15:06:30 +0100
In-Reply-To: <CA+BoTQ=YnQhjLwUU9jj_SBS_mji-pG=cYbdGtYusKC3pwVAirA@mail.gmail.com>
 (sfid-20150130_144728_059271_B371B04E)
References: <1422607287-12289-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-3-git-send-email-michal.kazior@tieto.com>
 <1422621903.1919.7.camel@sipsolutions.net>
 <CA+BoTQkdszYWbNJcV+1dDFsaSJ3aoTuC=ORUMr_aJx7_aQmcqw@mail.gmail.com>
 <1422623054.1919.18.camel@sipsolutions.net>
 <CA+BoTQnkqzHNWTFSc9VB4_itCK_+jC6HC8GmdMKiyrhu-Sz9Cg@mail.gmail.com>
 <1422624670.1919.21.camel@sipsolutions.net>
 <CA+BoTQ=YnQhjLwUU9jj_SBS_mji-pG=cYbdGtYusKC3pwVAirA@mail.gmail.com>
 (sfid-20150130_144728_059271_B371B04E)
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, 2015-01-30 at 14:47 +0100, Michal Kazior wrote:

> I'm not sure if you refer to iwlwifi or mac80211 now? If it's the
> latter: even if you have an ops with, e.g. vif pointer, driver may
> still need to iterate over interfaces in order to propagate some
> side-effect changes or aggregate some values/recalculate.

I was referring mostly to iwlwifi :)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
