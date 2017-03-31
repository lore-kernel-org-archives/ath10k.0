Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctuIr-0002wo-B2
 for ath10k@lists.infradead.org; Fri, 31 Mar 2017 11:01:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: firmware version 10.2.4.70.54 crash when running on
 centos-7.3(kernel version -> 3.10.0-514.el7.x86_64)
Date: Fri, 31 Mar 2017 11:00:46 +0000
Message-ID: <87y3vlr9r6.fsf@kamboji.qca.qualcomm.com>
References: <CAEi_5N3aP1F5ChkZ64jxpKmAAAEVwq0Ep_LGRnhFDfC6=N5v1w@mail.gmail.com>
In-Reply-To: <CAEi_5N3aP1F5ChkZ64jxpKmAAAEVwq0Ep_LGRnhFDfC6=N5v1w@mail.gmail.com>	(Chirag
 Shahani's message of "Thu, 30 Mar 2017 10:32:42 -0700")
Content-Language: en-US
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
To: Chirag Shahani <chirag.shahani@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Chirag Shahani <chirag.shahani@gmail.com> writes:

> I am using the ath10_pci driver with firmware version 10.2.4.70.54
> running on centos-7.3(kernel version -> 3.10.0-514.el7.x86_64). The
> driver came with centos 7.3 install. Could you please confirm this
> firmware is supported for this kernel version.

3.10 is ancient. I guess in theory it should work but nobody tests so
old version of ath10k. I recommend using backports package to upgrade
ath10k for your kernel.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
