Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJcZy-0006FQ-NX
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 06:07:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Support for scan while in AP mode, and offchannel while in AP mode
References: <CAHqTa-0GxKjo2ObRtoAKu6H9J6upC7JNS44MpNQpFDPXpiEKJw@mail.gmail.com>
 <8761hpc9j9.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1ZWg38dkT1N0fm3JkLL1kVc_pP1dsuCuorZxXm8z6M7Q@mail.gmail.com>
Date: Tue, 19 Aug 2014 09:07:05 +0300
In-Reply-To: <CAHqTa-1ZWg38dkT1N0fm3JkLL1kVc_pP1dsuCuorZxXm8z6M7Q@mail.gmail.com>
 (Avery Pennarun's message of "Tue, 19 Aug 2014 01:56:35 -0400")
Message-ID: <87wqa5au7q.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

Avery Pennarun <apenwarr@gmail.com> writes:

>>> Are there any plans to implement this feature?  It's important in
>>> order to implement automatic channel change in case of changes in the
>>> interference environment.
>>
>> No plans at the moment. Does anyone know how much work would it be to
>> change mac80211 to support this with hw_scan?
>
> Is there any particular reason it can't just resort to a sw_scan for
> this use case?  What's the benefit of hw_scan?  I'm surprised there
> would be any particular CPU time taken for such a thing.

For mobile devices hw_scan is important because the ability to allow the
host CPU to sleep while scanning. For others I'm not that sure, maybe
firmware can do timing better (less intrusive) than host based sw
scanning?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
