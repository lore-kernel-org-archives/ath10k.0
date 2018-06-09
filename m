Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fRdQF-0000fi-3c
 for ath10k@lists.infradead.org; Sat, 09 Jun 2018 12:56:49 +0000
Received: by mail-wr0-x231.google.com with SMTP id h10-v6so15885224wrq.8
 for <ath10k@lists.infradead.org>; Sat, 09 Jun 2018 05:56:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2485b7b4-82d6-ed0f-1799-9195563d9472@codeaurora.org>
References: <c92e04d5b80af2a640ab97efce32d987ffb27ffe.camel@gmail.com>
 <87po1e69tz.fsf@kamboji.qca.qualcomm.com>
 <bc31b06dc4093b8613fbde6a13f16bd7e8c31e82.camel@gmail.com>
 <87fu2a4mk5.fsf@kamboji.qca.qualcomm.com>
 <8691304d5e1a0a99f41ebfa4aec6ba192b13e46a.camel@gmail.com>
 <ecd19f9f5ef727547986b8c4dbf47c3e083c684b.camel@gmail.com>
 <89a29eb6-996e-1c8e-b332-c14fdf241b79@codeaurora.org>
 <1528486076.3619.2.camel@gmail.com>
 <2485b7b4-82d6-ed0f-1799-9195563d9472@codeaurora.org>
From: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Date: Sat, 9 Jun 2018 14:56:34 +0200
Message-ID: <CAFF-SiUY8zTD=ftTOn+5ZF+O6VCoLV+7uGvGhwfq5K-fhU+4yg@mail.gmail.com>
Subject: Re: Frequent ath10k crashes with QCA6174 on kernels 4.16 and 4.17
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
To: Ryan Hsu <ryanhsu@codeaurora.org>
Cc: ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Fri, Jun 8, 2018 at 10:25 PM, Ryan Hsu <ryanhsu@codeaurora.org> wrote:
> On 06/08/2018 12:27 PM, timur.kristof@gmail.com wrote:
>> Hi Ryan,
>>
>> I already posted a patch v2 here:
>> http://lists.infradead.org/pipermail/ath10k/2018-May/011545.html
>> (Basically made the same changes as you.)
>> Yes, it fixes the problem.
>
> Cool, thanks a lot!

Sure thing. I'm happy to see this issue go away!
During my testing I just ran the system for some time while connected
to an AP which I set into 20MHz/40MHz mode.
Without the patch: the firmware crashes, which after a while takes the
whole system down with it.
With the patch: I observed several successful bandwidth changes in the
logs, without any crash at all.

I believe the patch is ready to get merged. Doesn't matter if yours or
mine, as they are basically the same.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
