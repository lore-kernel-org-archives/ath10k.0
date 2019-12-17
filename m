Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihHbB-0004Zh-MS
 for ath10k@lists.infradead.org; Tue, 17 Dec 2019 18:29:34 +0000
Received: by mail-ot1-x341.google.com with SMTP id 66so14787503otd.9
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2019 10:29:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <11290a30-46e8-638e-4110-86e6b2eb3d3f@candelatech.com>
References: <20191216220747.887-1-greearb@candelatech.com>
 <a2af03e9-8b53-b297-467b-d0f07b8a002b@newmedia-net.de>
 <b5d63d96-4ba6-bbab-bf1c-a61c6c437f37@newmedia-net.de>
 <80700614-679a-336e-bd9a-e88622e75c9a@candelatech.com>
 <4775d91a-9719-46f8-b0f2-979b8d86cf9f@newmedia-net.de>
 <CAMrEMU-vGB8uR-JZbD2vj4vXgWNHfFqcbsqB=gOqBBDZWGkzQA@mail.gmail.com>
 <11290a30-46e8-638e-4110-86e6b2eb3d3f@candelatech.com>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Tue, 17 Dec 2019 19:29:31 +0100
Message-ID: <CAKR_QV+xNbAzzw12x3Ku49bHnERTxYRAK8AfUSwp_uOgNMbY4Q@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Per-chain rssi should sum the secondary channels
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
To: Ben Greear <greearb@candelatech.com>
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>, Justin Capella <justincapella@gmail.com>

On 17/12/2019, Ben Greear <greearb@candelatech.com> wrote:
> On 12/17/19 8:23 AM, Justin Capella wrote:
>> I believe someone recently submitted a patch that defined noise floors
>> per band (2/5).
>
> I looked at using the real noise floor.  Our radio was reporting a noise
> floor of around -102,
> where the hard-coded default is -95.  This of course would make the reported
> RSSI lower by 7db
> in that case.  I am not sure that is correct.
>

Hi

I am getting similar NF values with all my ath10k devices, I thought
default was changed since ath9k from -95 to -115 just like in the
vendor driver? There were some discussions about it on mailing list.
On some channels (5Ghz) the value goes down to about -107, even saw
-110 once.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
