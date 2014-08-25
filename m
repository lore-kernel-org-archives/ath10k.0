Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XLoFc-0005iN-HX
 for ath10k@lists.infradead.org; Mon, 25 Aug 2014 06:59:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Malformed AddBA Response prevents clients from associating?
References: <CABnBrYUtF_S+Gh9nwPQwOct1uA5wsLvwW_oxoYYVtWBqiRQROQ@mail.gmail.com>
 <CAJ-VmokR-2SQG-Hb+7yTXG-5X1PQ_VqB1wiYVCdWa17JyAnMTw@mail.gmail.com>
 <CABnBrYUv4tLcmOJLUD99B96jWRwepk1_-6NQ1LdEaCaPQ5QOwg@mail.gmail.com>
Date: Mon, 25 Aug 2014 09:59:08 +0300
In-Reply-To: <CABnBrYUv4tLcmOJLUD99B96jWRwepk1_-6NQ1LdEaCaPQ5QOwg@mail.gmail.com>
 (Denton Gentry's message of "Sun, 24 Aug 2014 19:28:52 -0700")
Message-ID: <87sikl6on7.fsf@kamboji.qca.qualcomm.com>
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
To: Denton Gentry <denton.gentry@gmail.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Denton Gentry <denton.gentry@gmail.com> writes:

> [   18.047597] ath10k: qca988x hw2.0 (0x4100016c, 0x043202ff) fw
> 10.1.467.2-1 api 2 htt 2.1
>
> On Sun, Aug 24, 2014 at 7:22 PM, Adrian Chadd <adrian@freebsd.org> wrote:
>> Which firmware build are you using?

(Standard whining: top posting is annoying.)

Denton, any chance you could test with 10.2 firmware and see if the bug
happens on that firmware as well? I don't know what version of ath10k
you are using, but I think it should be enough to just to have this
patch:

https://github.com/kvalo/ath/commit/24c88f7807fb7c723690474d0a5d3441468185d9

And then take the firmware from here:

https://github.com/kvalo/ath10k-firmware/tree/master/10.2

Do not rename the firmware to firmware-2.bin or anything like that. To
avoid problems keep the name firmware-3.bin.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
