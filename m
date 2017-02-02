Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua0-f178.google.com ([209.85.217.178])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZAbk-0008U2-DP
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 06:11:02 +0000
Received: by mail-ua0-f178.google.com with SMTP id 35so4483697uak.1
 for <ath10k@lists.infradead.org>; Wed, 01 Feb 2017 22:10:38 -0800 (PST)
MIME-Version: 1.0
From: Sergey Stepanov <no.such.process@gmail.com>
Date: Thu, 2 Feb 2017 11:09:36 +0500
Message-ID: <CABuVar+gi+Mb3T2wpooysykdWWEofubeCrso45svVyV2H-_CqA@mail.gmail.com>
Subject: firmware register dump description
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
To: ath10k@lists.infradead.org

Hi

Are there any description, what the contents of these 60+ registers
mean, or if one is under NDA. which one of them address pointers, or
bitfields, indexes, etc.?

> firmware register dump:
> [00]: 0x01000000 0x00000000 0x0099F31B 0x030DE28B
> [04]: 0x0099F31B 0x00060730 0x00000016 0x00000000
> [08]: 0x030DE233 0x00000001 0x00000000 0x004179D8
> [12]: 0x00000009 0x00000007 0x009CD986 0x009CD9DD
> [16]: 0x00953438 0x009406B6 0x009406B6 0x00000000
> [20]: 0x4099F31B 0x0040658C 0x0000FFFF 0x00413A80
> [24]: 0x809A0398 0x004065EC 0x00030000 0xC099F31B
> [28]: 0x809CDA1B 0x0040661C 0x000E8284 0x0000901C
> [32]: 0x809B307A 0x004066AC 0x009A0370 0x0042026C
> [36]: 0x809AF3DA 0x004066FC 0x00000002 0x0042026C
> [40]: 0x809AEB02 0x0040672C 0x00406750 0x0041847C
> [44]: 0x8094EAAA 0x0040674C 0x000E8278 0x00000001
> [48]: 0x8094F3FC 0x004067FC 0x00421E14 0x00418AF8
> [52]: 0x80943905 0x0040681C 0x00421E14 0x00000001
> [56]: 0x80940E40 0x0040687C 0x0000000D 0x00002000

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
