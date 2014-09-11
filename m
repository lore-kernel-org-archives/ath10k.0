Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XS1vQ-0006Bi-Fn
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 10:48:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC] ath10k: use raw tx
References: <1408693965-29858-1-git-send-email-michal.kazior@tieto.com>
 <5400F497.7070904@candelatech.com>
 <CA+BoTQnhqxtHcX46-U+TjQBMDm27jM11xCJ956UFM_gjMvvs+A@mail.gmail.com>
Date: Thu, 11 Sep 2014 13:47:58 +0300
In-Reply-To: <CA+BoTQnhqxtHcX46-U+TjQBMDm27jM11xCJ956UFM_gjMvvs+A@mail.gmail.com>
 (Michal Kazior's message of "Thu, 11 Sep 2014 12:35:52 +0200")
Message-ID: <87ha0e302p.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 29 August 2014 23:45, Ben Greear <greearb@candelatech.com> wrote:
>> On 08/22/2014 12:52 AM, Michal Kazior wrote:
>>> This is just a reference for anyone interested in
>>> getting injection working with ath10k.
>>
>> Did you try this with encryption?  I can reproduce the crash
>> in open mode on my CT firmware, but I couldn't even get
>> DHCP to complete with wpa2 enabled.
>
> Hi,
>
> Late reply, sorry.
>
> I've just did a quick test on 10.2 (both AP and STA) with WPA2.
> Apparently the raw tx mode requires IV to be set up on host and packet
> length (reported in HTT Tx command header) must be re-adjusted
> differently, otherwise frames are broken (incorrect FCS, too long,
> somewhat encrypted except LLC/SNAP). The best I could get were
> FCS-correct undecryptable frames on air. Perhaps someone will figure
> that out..
>
> Another way around this would be to perform software crypto for tx
> entirely on host.

BTW, it would be nice to get software crypto support to ath10k, for
example with a nohwcrypt module parameter like ath9k has.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
