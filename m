Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cZHo5-0005r9-C2
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 13:52:15 +0000
Message-ID: <58933976.5020403@candelatech.com>
Date: Thu, 02 Feb 2017 05:51:50 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: firmware register dump description
References: <CABuVar+gi+Mb3T2wpooysykdWWEofubeCrso45svVyV2H-_CqA@mail.gmail.com>
In-Reply-To: <CABuVar+gi+Mb3T2wpooysykdWWEofubeCrso45svVyV2H-_CqA@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sergey Stepanov <no.such.process@gmail.com>, ath10k@lists.infradead.org

Someone who has access to the source can decode these
if they have the right tools, but you have to let them know
the exact firmware version, and then you have to get lucky
and hope someone has time to work on it for you.

Thanks,
Ben

On 02/01/2017 10:09 PM, Sergey Stepanov wrote:
> Hi
>
> Are there any description, what the contents of these 60+ registers
> mean, or if one is under NDA. which one of them address pointers, or
> bitfields, indexes, etc.?
>
>> firmware register dump:
>> [00]: 0x01000000 0x00000000 0x0099F31B 0x030DE28B
>> [04]: 0x0099F31B 0x00060730 0x00000016 0x00000000
>> [08]: 0x030DE233 0x00000001 0x00000000 0x004179D8
>> [12]: 0x00000009 0x00000007 0x009CD986 0x009CD9DD
>> [16]: 0x00953438 0x009406B6 0x009406B6 0x00000000
>> [20]: 0x4099F31B 0x0040658C 0x0000FFFF 0x00413A80
>> [24]: 0x809A0398 0x004065EC 0x00030000 0xC099F31B
>> [28]: 0x809CDA1B 0x0040661C 0x000E8284 0x0000901C
>> [32]: 0x809B307A 0x004066AC 0x009A0370 0x0042026C
>> [36]: 0x809AF3DA 0x004066FC 0x00000002 0x0042026C
>> [40]: 0x809AEB02 0x0040672C 0x00406750 0x0041847C
>> [44]: 0x8094EAAA 0x0040674C 0x000E8278 0x00000001
>> [48]: 0x8094F3FC 0x004067FC 0x00421E14 0x00418AF8
>> [52]: 0x80943905 0x0040681C 0x00421E14 0x00000001
>> [56]: 0x80940E40 0x0040687C 0x0000000D 0x00002000
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
