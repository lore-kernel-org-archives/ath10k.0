Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([144.76.43.152] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdFMz-00019m-5W
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 08:51:01 +0000
Message-ID: <1398329415.4154.1.camel@jlt4.sipsolutions.net>
Subject: Re: [PATCH] ath10k: don't allow stand alone monitor mode for non-AP
 firmware
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 24 Apr 2014 10:50:15 +0200
In-Reply-To: <CA+BoTQkBCGyKYDaOMgdCi4Yw+SXeuRS+t0rGE8o=8+x2q5N74w@mail.gmail.com>
 (sfid-20140424_104431_792919_3603D338)
References: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
 <CA+BoTQkBCGyKYDaOMgdCi4Yw+SXeuRS+t0rGE8o=8+x2q5N74w@mail.gmail.com>
 (sfid-20140424_104431_792919_3603D338)
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
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, 2014-04-24 at 10:44 +0200, Michal Kazior wrote:

> I think Monitor operation should be performed on a best effort basis.
> This means monitor_start/stop should be attempted once number of
> non-monitor vdevs changes.
> 
> We should probably introduce a ath10k_recalc_monitor() for that purpose.

Doesn't mac80211 do that for you?

See IEEE80211_HW_WANT_MONITOR_VIF.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
