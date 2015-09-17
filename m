Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcWtW-00087X-HT
 for ath10k@lists.infradead.org; Thu, 17 Sep 2015 10:58:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 1/3] ath10k: enable monitor when OTHER_BSS requested
References: <1441817256-3997-1-git-send-email-me@bobcopeland.com>
Date: Thu, 17 Sep 2015 13:57:51 +0300
In-Reply-To: <1441817256-3997-1-git-send-email-me@bobcopeland.com> (Bob
 Copeland's message of "Wed, 9 Sep 2015 12:47:34 -0400")
Message-ID: <87d1xhuxcg.fsf@kamboji.qca.qualcomm.com>
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
To: Bob Copeland <me@bobcopeland.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bob Copeland <me@bobcopeland.com> writes:

> By default, ath10k restricts received frames to those matching BSSID.
> When other BSS frames are requested (e.g. in mesh mode), add an internal
> monitor device so those frames are not filtered.
>
> Signed-off-by: Bob Copeland <me@bobcopeland.com>

Thanks, all three patches applied. In patch 3 I just changed the
firmware version in commit log to 10.2.4.70.6-2 as that one has the raw
mode feature flag enabled.

I also tested this myself and I was able to join to a mesh network I
created with ath9k and ping each other. In case someone cherry picks
these patches please take into account that these patches need quite a
few recent mac80211 patches from mac80211-next. The patches are also in
wireless-testing and ath.git master branch. Safest is to test with
ath.git master branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
