Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTAoE-0000lf-Nb
 for ath10k@lists.infradead.org; Wed, 04 Mar 2015 15:02:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 3/4] mac80211: initialize rate control earlier for tdls
 station
References: <1424850911-21017-1-git-send-email-marek.puzyniak@tieto.com>
 <1424850911-21017-4-git-send-email-marek.puzyniak@tieto.com>
 <1425041427.1960.1.camel@sipsolutions.net>
Date: Wed, 4 Mar 2015 17:01:29 +0200
In-Reply-To: <1425041427.1960.1.camel@sipsolutions.net> (Johannes Berg's
 message of "Fri, 27 Feb 2015 13:50:27 +0100")
Message-ID: <878ufc7qnq.fsf@kamboji.qca.qualcomm.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Arik Nemtsov <arikx.nemtsov@intel.com>

Johannes Berg <johannes@sipsolutions.net> writes:

> +Arik.
>
> It'd be nice (for me anyway) if you didn't send this in a series of
> other patches I don't care about - I only ever saw this due to
> patchwork.

Yes, mac80211 and driver patches need to be sent in separate series. I
will drop this series for now, please resend ath10k patches separetely.

AND please clearly document what mac80211 patches the ath10k patches
depend on.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
