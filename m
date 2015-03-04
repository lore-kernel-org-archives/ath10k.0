Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YT4UN-0006Xh-GV
 for ath10k@lists.infradead.org; Wed, 04 Mar 2015 08:17:08 +0000
Message-ID: <1425456998.1810.3.camel@sipsolutions.net>
Subject: Re: [PATCH v2 3/4] mac80211: initialize rate control earlier for
 tdls station
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 04 Mar 2015 09:16:38 +0100
In-Reply-To: <CA+XVXfdu2fCLXBP1VkMOX9nnoqCiH+h=pwzGAQ2KkBrf-H9MCQ@mail.gmail.com>
 (sfid-20150303_110729_103523_A070BCE6)
References: <1424850911-21017-1-git-send-email-marek.puzyniak@tieto.com>
 <1424850911-21017-4-git-send-email-marek.puzyniak@tieto.com>
 <1425041427.1960.1.camel@sipsolutions.net>
 <CA+XVXfchZ+L1iH47S=rM04vJbjBSKA4O8TYuhEkfZuLpNb9QDA@mail.gmail.com>
 <1425374299.2450.18.camel@sipsolutions.net>
 <CA+XVXffHENxD3z9dTn_LC9c7Ot0Q4FgyEoHLjdeiDTFWQGuF9w@mail.gmail.com>
 <1425377192.2450.34.camel@sipsolutions.net>
 <CA+XVXfdu2fCLXBP1VkMOX9nnoqCiH+h=pwzGAQ2KkBrf-H9MCQ@mail.gmail.com>
 (sfid-20150303_110729_103523_A070BCE6)
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
To: Arik Nemtsov <arik@wizery.com>
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Arik Nemtsov <arikx.nemtsov@intel.com>

On Tue, 2015-03-03 at 12:07 +0200, Arik Nemtsov wrote:

> > And doing so would also address the nss problem, right? IIRC that's done
> > in the rate control init inline.
> 
> Right.

Can one of you (Marek/Arik) send a combined patch then please? :)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
