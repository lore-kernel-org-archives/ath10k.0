Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAut2-0003OQ-EJ
 for ath10k@lists.infradead.org; Tue, 24 Apr 2018 10:09:40 +0000
Received: by mail-oi0-x241.google.com with SMTP id 126-v6so17122877oig.0
 for <ath10k@lists.infradead.org>; Tue, 24 Apr 2018 03:09:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2287275.ke1ujnQGTK@debian64>
References: <CACD9L=BXEQRQVWGP5iMvSNOP7nHz68W62+q6xEZkeb2vZ13DKQ@mail.gmail.com>
 <CAJ-Vmo=+2mVUHzQa7rrgfE9ARpedyBS17urUGjwLLoGgy2WSiw@mail.gmail.com>
 <CACD9L=A9WZdeKpexptW1N1jLgfn0AmCLj0PQJQdFO1KyBnvZXw@mail.gmail.com>
 <2287275.ke1ujnQGTK@debian64>
From: Arvid Picciani <aep@exys.org>
Date: Tue, 24 Apr 2018 12:09:12 +0200
Message-ID: <CACD9L=ArS9T6YJK+UdfmT65r1b+0swa5R4C4QvHZ4A+ufaYHdw@mail.gmail.com>
Subject: Re: failed to run otp: -22
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
To: Christian Lamparter <chunkeey@gmail.com>
Cc: ath10k@lists.infradead.org

yes, found it :) ath10k coming up now. thanks!

On Mon, Apr 23, 2018 at 11:27 PM, Christian Lamparter
<chunkeey@gmail.com> wrote:
> On Montag, 23. April 2018 22:31:22 CEST Arvid Picciani wrote:
>> from where does ath10k know where to look for it? all i know about is
>> ath79_register_wmac  in arch init. That points to a partition called
>> "wifi" which makes ath9k work, but not ath10k.
>
> It's this file:
> <https://github.com/openwrt/openwrt/blob/master/target/linux/ar71xx/base-files/etc/hotplug.d/firmware/11-ath10k-caldata#L136>
>
> Or
>
> /etc/hotplug.d/firmware/11-ath10k-caldata
> on your device. (Thing is, the partition should be called "art"?!
> and there needs to be a handle for your archer-c7-v5.)
>
>
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
