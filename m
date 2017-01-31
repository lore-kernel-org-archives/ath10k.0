Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYWi0-0007pH-9w
 for ath10k@lists.infradead.org; Tue, 31 Jan 2017 11:34:50 +0000
Received: by mail-qk0-x22f.google.com with SMTP id u25so159870212qki.2
 for <ath10k@lists.infradead.org>; Tue, 31 Jan 2017 03:34:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <c3814c7d-eed3-dad2-c568-6ce456ee7166@gmail.com>
References: <CAHNpzpeRE6ha4JA9i4oyJ2BjgJg53FvDpAb1yZccncrmTeiBdQ@mail.gmail.com>
 <8737g45xc7.fsf@kamboji.qca.qualcomm.com>
 <c3814c7d-eed3-dad2-c568-6ce456ee7166@gmail.com>
From: Akesh M Chacko <akesh.chacko@vvdntech.in>
Date: Tue, 31 Jan 2017 17:04:26 +0530
Message-ID: <CAHNpzpdbTnapQFPwYhUhi5EvLjQSdpqy9AHMH04KcqF2jHWw_A@mail.gmail.com>
Subject: Re: Driver support for QCA6174 chip using SDIO interface
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
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, Ann Lo <annlo.tech@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Thanks for sharing the patches,
Our custom board is under assembly stage, once we have the board, will
test it and let u know
Thanks & Regards
Akesh M Chacko
Cell : +91 9567084416| Skype: akesh.vvdn | mail : akesh.chacko@vvdntech.in


On Mon, Jan 30, 2017 at 2:46 AM, Erik Stromdahl
<erik.stromdahl@gmail.com> wrote:
> If you are interested in trying the latest version of the sdio code
> you can clone the below repo:
>
> https://github.com/erstrom/linux-ath.git
>
> I have just pushed some updates for QCA9377 SDIO (that might work with
> QCA6174 chipsets as well).
>
> I will do some more testing of this code during the weeks to come.
>
> If you could try it out and give me feedback it would be great!
>
>
> On 2017-01-27 16:36, Valo, Kalle wrote:
>>
>> Akesh M Chacko <akesh.chacko@vvdntech.in> writes:
>>
>>> We are using QCA6174 chip on our embedded platform using SDIO
>>> interface. could you please help us to get the SDIO support for
>>> QCA6174 driver.
>>
>>
>> Erik Stromdahl is working on adding SDIO support to ath10k:
>>
>> https://patchwork.kernel.org/patch/9516477/
>>
>> But it's still WIP.
>>
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
