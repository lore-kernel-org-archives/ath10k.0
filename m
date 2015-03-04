Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YT6AT-0002wQ-UX
 for ath10k@lists.infradead.org; Wed, 04 Mar 2015 10:04:42 +0000
Received: by lams18 with SMTP id s18so43369034lam.13
 for <ath10k@lists.infradead.org>; Wed, 04 Mar 2015 02:04:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1425456998.1810.3.camel@sipsolutions.net>
References: <1424850911-21017-1-git-send-email-marek.puzyniak@tieto.com>
 <1424850911-21017-4-git-send-email-marek.puzyniak@tieto.com>
 <1425041427.1960.1.camel@sipsolutions.net>
 <CA+XVXfchZ+L1iH47S=rM04vJbjBSKA4O8TYuhEkfZuLpNb9QDA@mail.gmail.com>
 <1425374299.2450.18.camel@sipsolutions.net>
 <CA+XVXffHENxD3z9dTn_LC9c7Ot0Q4FgyEoHLjdeiDTFWQGuF9w@mail.gmail.com>
 <1425377192.2450.34.camel@sipsolutions.net>
 <CA+XVXfdu2fCLXBP1VkMOX9nnoqCiH+h=pwzGAQ2KkBrf-H9MCQ@mail.gmail.com>
 <1425456998.1810.3.camel@sipsolutions.net>
From: Arik Nemtsov <arik@wizery.com>
Date: Wed, 4 Mar 2015 12:04:01 +0200
Message-ID: <CA+XVXfdnTATvbPSkHmGSyMF5d++OmYySskD7D50YvH-wf4eM=w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mac80211: initialize rate control earlier for tdls
 station
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
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Arik Nemtsov <arikx.nemtsov@intel.com>

On Wed, Mar 4, 2015 at 10:16 AM, Johannes Berg
<johannes@sipsolutions.net> wrote:
> On Tue, 2015-03-03 at 12:07 +0200, Arik Nemtsov wrote:
>
>> > And doing so would also address the nss problem, right? IIRC that's done
>> > in the rate control init inline.
>>
>> Right.
>
> Can one of you (Marek/Arik) send a combined patch then please? :)

I can do it, but I'll probably only get to it next week.

Arik

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
