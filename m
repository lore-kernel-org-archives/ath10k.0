Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihWi4-0002o3-WB
 for ath10k@lists.infradead.org; Wed, 18 Dec 2019 10:37:42 +0000
Received: by mail-lj1-f198.google.com with SMTP id z18so542085ljm.22
 for <ath10k@lists.infradead.org>; Wed, 18 Dec 2019 02:37:37 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 2/4] mac80211: fix issue in loop scenario
In-Reply-To: <c126d2ff0866faf9ac50b12920f0497b03b031f7.camel@sipsolutions.net>
References: <1576221593-1086-1-git-send-email-yiboz@codeaurora.org>
 <1576221593-1086-3-git-send-email-yiboz@codeaurora.org>
 <94471b2381bee394f9708eae8ba47129f3facd03.camel@sipsolutions.net>
 <6f092bd44cfc581a219bd0f0506cc636@codeaurora.org>
 <c126d2ff0866faf9ac50b12920f0497b03b031f7.camel@sipsolutions.net>
Date: Wed, 18 Dec 2019 11:37:34 +0100
Message-ID: <87h81x7wcx.fsf@toke.dk>
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
To: Johannes Berg <johannes@sipsolutions.net>, yiboz@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Johannes Berg <johannes@sipsolutions.net> writes:

> On Wed, 2019-12-18 at 18:12 +0800, yiboz@codeaurora.org wrote:
>> 
>> Yes, this is a fix to the first patch. Actually, the rest of two patches 
>> are also serve the same. So, are you suggesting to merge them to the 
>> first patch?
>
> Yes.
>
>> Previouly, I had added Toke's signature in this patch but Toke advised 
>> to delete it. I feel a little bit confused about how to handle it. 
>> Appreciate any detail guide.
>
> I guess that you have to discuss that with Toke, how he wants to handle
> it ... If he gave you a patch with his signed-off-by, then you should
> probably keep it? There's also "Co-developed-by" tag to give some sort
> of non-author developer credits.

I'll do some squashing and send a new version; in which case I think it
makes sense to have both our s-o-b tags, and maybe a co-developed-by.

I'm hoping to get this done before the holidays (i.e., this week).
Already got everything rebased to current mac80211-next, just need to do
the squashing and fix up the other outstanding issues from last time.

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
