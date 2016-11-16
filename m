Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c70eU-00053V-AD
 for ath10k@lists.infradead.org; Wed, 16 Nov 2016 13:53:30 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 02/12] ath10k: htc: rx trailer lookahead support
Date: Wed, 16 Nov 2016 13:53:00 +0000
Message-ID: <87eg2bo7k7.fsf@kamboji.qca.qualcomm.com>
References: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
 <1479141222-8493-3-git-send-email-erik.stromdahl@gmail.com>
 <CA+BoTQkJqv28=Mg1ncmyznRo-CLh6Y_OW-mJ+YTyqaREaqp39Q@mail.gmail.com>
 <ac58b3f6-4432-b0b6-8b50-c733f898eded@gmail.com>
In-Reply-To: <ac58b3f6-4432-b0b6-8b50-c733f898eded@gmail.com> (Erik
 Stromdahl's message of "Tue, 15 Nov 2016 18:31:15 +0100")
Content-Language: en-US
Content-ID: <F2180D525DC86A4C9176FF7F2C6A489D@qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> On 11/15/2016 10:57 AM, Michal Kazior wrote:
>> On 14 November 2016 at 17:33, Erik Stromdahl <erik.stromdahl@gmail.com> wrote:
>>> The RX trailer parsing is now capable of parsing lookahead reports.
>>> This is needed by SDIO/mbox.
>> 
>> It'd be useful to know what exactly lookahead will be used for. What
>> payload does it carry.
>> 
> It carries the 4 first bytes of the next RX message, i.e. the first 4
> bytes of an HTC header.
>
> It is used by the sdio interrupt handler to know if the next packet is a
> part of an RX bundle, which endpoint it belongs to and how long it is
> (so we know how many bytes to allocate).

Please add that to the commit log, it's useful information. Or maybe a
code comment would be better?

>>> +static int
>>> +ath10k_htc_process_lookahead(struct ath10k_htc *htc,
>>> +                            const struct ath10k_htc_lookahead_report *report,
>>> +                            int len,
>>> +                            enum ath10k_htc_ep_id eid,
>>> +                            u32 *next_lk_ahds,
>> 
>> next_lk_ahds should be u8 or void. From what I understand by glancing
>> through the code it is an agnostic buffer that carries payload which
>> is later interpreted either as eid or htc header, right? void is
>> probably most suitable in this case for passing around and u8 for
>> inline-based storage.
>> 
> Sounds reasonable, I'll change to void pointer.
>
>> I'd also avoid silly abbreviations. Probably "lookahead" alone is enough.
>> 
> Ok, this abbreviation was actually taken from the ath6kl code. I think
> the intention was to reduce line lengths.

Most likely that comes from the staging ath6kl driver which again is a
fork of the Atheros internal driver. I agree with Michal, better to
avoid silly abbreviations as much as possible. Readability is most
important.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
