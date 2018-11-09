Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([2001:470:dc45:1000::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL64N-0005YR-0A
 for ath10k@lists.infradead.org; Fri, 09 Nov 2018 12:39:29 +0000
Date: Fri, 09 Nov 2018 13:39:06 +0100
In-Reply-To: <78adf728bab8943152dc4db311c50fedbe5710f1.camel@sipsolutions.net>
References: <1540033534-11211-1-git-send-email-rmanohar@codeaurora.org>
 <1540033534-11211-2-git-send-email-rmanohar@codeaurora.org>
 (sfid-20181020_130555_381291_6F3867B0)
 <78adf728bab8943152dc4db311c50fedbe5710f1.camel@sipsolutions.net>
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] mac80211: Add TXQ scheduling API
From: =?ISO-8859-1?Q?Toke_H=F8iland-J=F8rgensen?= <toke@toke.dk>
Message-ID: <A76C82FF-46AD-4BDB-A5DA-932E97536FEB@toke.dk>
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
To: Johannes Berg <johannes@sipsolutions.net>, Rajkumar Manoharan <rmanohar@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 9 November 2018 13:00:04 CET, Johannes Berg <johannes@sipsolutions.net> wrote:
>On Sat, 2018-10-20 at 04:05 -0700, Rajkumar Manoharan wrote:
>> 
>> + * @txq: pointer obtained from station or virtual interface, or from
>> + *       ieee80211_next_txq()
>
>nit: please just indent by a single tab for continuation, trying to
>line
>it all up doesn't really make it more readable

Not sure I agree about the "not more readable" part, but OK.

>I see you're still discussing all this, so I'm going to assume you'll
>resend this series eventually :-)

Yup. Think we're getting close to something that might be mergeable. Will send another version then :)

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
