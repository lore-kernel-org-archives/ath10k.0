Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buJzv-0000Le-8x
 for ath10k@lists.infradead.org; Wed, 12 Oct 2016 13:55:08 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Very low throughput on QCA9880 ath10k module
Date: Wed, 12 Oct 2016 13:54:42 +0000
Message-ID: <871szlfza6.fsf@kamboji.qca.qualcomm.com>
References: <CANfwihOywsOteLXGa_zHMep-V+6axkUTGbMZjf--0u9ecavdCQ@mail.gmail.com>
In-Reply-To: <CANfwihOywsOteLXGa_zHMep-V+6axkUTGbMZjf--0u9ecavdCQ@mail.gmail.com>	(Vijay
 Kumar R. Patel's message of "Thu, 6 Oct 2016 09:27:11 +0530")
Content-Language: en-US
Content-ID: <9883E221DF48A040AFAACA9BB90726CF@qualcomm.com>
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
To: Vijay Kumar R Patel <vijay@lukup.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Vijay Kumar R Patel <vijay@lukup.com> writes:

> HI all,
> we are testing throughput on our QCA9880 module using iperf command,
> we are getting 10Mbps throughput, tried with all iperf options like
> TCP window size,length but not getting more than 10Mbps.
>
> Test procedure and system info
> iperf b/w AP <----> STA
> QCA9880 module on both ap and sta, with backported(backports-3.14-1)
> ath10k driver running on Linux kernel version 2.6.32 with
> firmware-2.bin_10.1.467.3-1

From ath10k point of view backports-3.14-1 is ancient. Try upgrading to
something recent, preferably 4.8.

The problem is that backports doesn't have had new releases for some
time so you have to build the backports package yourself. There are
instructions on the wiki but I'm not sure if they work anymore, I
haven't tried myself for a long time:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/backports

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
