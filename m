Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abZ30-0003XZ-Lk
 for ath10k@lists.infradead.org; Thu, 03 Mar 2016 19:36:31 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Per radio configuration
Date: Thu, 3 Mar 2016 19:36:04 +0000
Message-ID: <87io131hi8.fsf@kamboji.qca.qualcomm.com>
References: <56B3BCF0.7070408@candelatech.com>
 <877fhj3774.fsf@kamboji.qca.qualcomm.com>	<56D8694D.9040502@candelatech.com>
 <87y49z1mwj.fsf@kamboji.qca.qualcomm.com>
 <CAGyitvNf8ZvrZnQfmNimeJvWcTmAtZLwQ-qae62SB9iQEwXQzQ@mail.gmail.com>
In-Reply-To: <CAGyitvNf8ZvrZnQfmNimeJvWcTmAtZLwQ-qae62SB9iQEwXQzQ@mail.gmail.com>	(Jasmine
 Strong's message of "Thu, 3 Mar 2016 10:50:49 -0800")
Content-Language: en-US
Content-ID: <4C39C137BC08F5409B12B95046F1566D@qualcomm.com>
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
To: Jasmine Strong <jas@eero.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

Jasmine Strong <jas@eero.com> writes:

> This seems like the sort of thing the flattened device tree was
> intended to do.

I'm no DT expert but isn't device tree supposed to only describe
hardware properties? This is more like a software property, for example
how to allocate memory on the firmware etc.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
