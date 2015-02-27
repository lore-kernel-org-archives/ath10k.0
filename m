Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRKNe-0004QV-VM
 for ath10k@lists.infradead.org; Fri, 27 Feb 2015 12:50:59 +0000
Message-ID: <1425041427.1960.1.camel@sipsolutions.net>
Subject: Re: [PATCH v2 3/4] mac80211: initialize rate control earlier for
 tdls station
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 27 Feb 2015 13:50:27 +0100
In-Reply-To: <1424850911-21017-4-git-send-email-marek.puzyniak@tieto.com>
 (sfid-20150225_085335_433402_71CE8ACD)
References: <1424850911-21017-1-git-send-email-marek.puzyniak@tieto.com>
 <1424850911-21017-4-git-send-email-marek.puzyniak@tieto.com>
 (sfid-20150225_085335_433402_71CE8ACD)
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>, Arik Nemtsov <arikx.nemtsov@intel.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

+Arik.

It'd be nice (for me anyway) if you didn't send this in a series of
other patches I don't care about - I only ever saw this due to
patchwork.

On Wed, 2015-02-25 at 08:55 +0100, Marek Puzyniak wrote:
> Currently when TDLS station in driver goes from assoc
> to authorized state it can not use rate control parameters
> because rate control is not initialized yet. Some drivers
> require parameters already initialized by rate control when
> entering authorized state. It can be done by initializing
> rate control after station transition to authorized state
> but before notifying driver about that.

Arik, you have a similar patch handling only NSS. Does this one look
fine to you, and would it solve the problem your other patch solved?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
