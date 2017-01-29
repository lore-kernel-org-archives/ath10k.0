Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cXwrM-0000Pv-Kx
 for ath10k@lists.infradead.org; Sun, 29 Jan 2017 21:18:07 +0000
Received: by mail-lf0-f65.google.com with SMTP id x1so30062260lff.0
 for <ath10k@lists.infradead.org>; Sun, 29 Jan 2017 13:17:42 -0800 (PST)
Subject: Re: Driver support for QCA6174 chip using SDIO interface
References: <CAHNpzpeRE6ha4JA9i4oyJ2BjgJg53FvDpAb1yZccncrmTeiBdQ@mail.gmail.com>
 <8737g45xc7.fsf@kamboji.qca.qualcomm.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <c3814c7d-eed3-dad2-c568-6ce456ee7166@gmail.com>
Date: Sun, 29 Jan 2017 22:16:39 +0100
MIME-Version: 1.0
In-Reply-To: <8737g45xc7.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>, Akesh M Chacko <akesh.chacko@vvdntech.in>, Ann Lo <annlo.tech@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

If you are interested in trying the latest version of the sdio code
you can clone the below repo:

https://github.com/erstrom/linux-ath.git

I have just pushed some updates for QCA9377 SDIO (that might work with
QCA6174 chipsets as well).

I will do some more testing of this code during the weeks to come.

If you could try it out and give me feedback it would be great!

On 2017-01-27 16:36, Valo, Kalle wrote:
> Akesh M Chacko <akesh.chacko@vvdntech.in> writes:
>
>> We are using QCA6174 chip on our embedded platform using SDIO
>> interface. could you please help us to get the SDIO support for
>> QCA6174 driver.
>
> Erik Stromdahl is working on adding SDIO support to ath10k:
>
> https://patchwork.kernel.org/patch/9516477/
>
> But it's still WIP.
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
