Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFFyL-0002FI-H3
 for ath10k@lists.infradead.org; Tue, 01 Oct 2019 11:05:39 +0000
Received: by mail-lf1-f72.google.com with SMTP id c83so2680360lfg.8
 for <ath10k@lists.infradead.org>; Tue, 01 Oct 2019 04:05:29 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH V3 0/4] Enable virtual time-based airtime scheduler
 support on ath10k
In-Reply-To: <e710a18d65ecaf2168a27556c85dada8@codeaurora.org>
References: <1569223201-1490-1-git-send-email-yiboz@codeaurora.org>
 <20985660fd0872db1511948bd42cd925cef13cee.camel@sipsolutions.net>
 <e710a18d65ecaf2168a27556c85dada8@codeaurora.org>
Date: Tue, 01 Oct 2019 13:05:26 +0200
Message-ID: <8736gcvi89.fsf@toke.dk>
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
To: Yibo Zhao <yiboz@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yibo Zhao <yiboz@codeaurora.org> writes:

> On 2019-10-01 18:19, Johannes Berg wrote:
>> On Mon, 2019-09-23 at 15:19 +0800, Yibo Zhao wrote:
>>> This series fix some issues when enabling virtual time-based airtime 
>>> scheduler on ath10k.
>>> 
>> Given the lengthy discussion here and also over in the related thread
>> about AQL, I'm assuming you're going to repost this eventually.
>
> Yes, will repost once Toke have updated "mac80211: Switch to a virtual 
> time-based airtime scheduler" with his new ideas.

Which in turn is waiting for the AQL stuff... :)

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
