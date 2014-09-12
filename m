Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSNiJ-0006e5-18
 for ath10k@lists.infradead.org; Fri, 12 Sep 2014 10:04:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC PATCH 2/3] ath10k: add diag_read() to hif ops
References: <20140911202926.12514.79908.stgit@potku.adurom.net>
 <20140911203147.12514.84857.stgit@potku.adurom.net>
 <CA+BoTQ=oj9SkaeWBbX2jsD2UHUknhb6f_-ZUBbVSmuWUXFvm-g@mail.gmail.com>
Date: Fri, 12 Sep 2014 13:03:48 +0300
In-Reply-To: <CA+BoTQ=oj9SkaeWBbX2jsD2UHUknhb6f_-ZUBbVSmuWUXFvm-g@mail.gmail.com>
 (Michal Kazior's message of "Fri, 12 Sep 2014 11:57:46 +0200")
Message-ID: <878ulpyx2z.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 11 September 2014 22:31, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> diag_read() is used for reading from firmware memory via the diagnose window.
>> First user will be cal_data debugfs file.
> [...]
>> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
>> index 154451ab3e3c..d3c51079034e 100644
>> --- a/drivers/net/wireless/ath/ath10k/pci.c
>> +++ b/drivers/net/wireless/ath/ath10k/pci.c
>> @@ -941,6 +941,13 @@ err:
>>         return err;
>>  }
>>
>> +static int ath10k_pci_hif_diag_read(struct ath10k *ar, u32 address, void *buf,
>> +                                   size_t buf_len)
>> +{
>> +       /* FIXME: locking */
>> +       return ath10k_pci_diag_read_mem(ar, address, buf, buf_len);
>
> Hmm.. This can potentially collide with firmware crash as it uses CE
> diag window as well.

Yeah, I was worried something like that could happen.

> I'm thinking entire bodies of diag_read_mem()/diag_writemem() should
> be protected by ar_pci->ce_lock. It shouldn't be hard. As for
> diag_read_mem():
>
>  * s/ath10k_ce_rx_post_buf/__ath10k_ce_rx_post_buf/
>  * s/ath10k_ce_send/ath10k_ce_send_nolock/
>  * s/ath10k_ce_completed_send_next/ath10k_ce_completed_send_next_nolock/
>  * s/ath10k_ce_completed_recv_next/ath10k_ce_completed_recv_next_nolock/
>
> Note: Most _nolock stuff is static in ce.c so it needs to be changed
> to be accessible in pci.c.

Sounds like a good idea, I'll take a closer look and see how it works
out. On the downside this means that there will be one more function
call in hot path (I assume the compiler is able to inline the _nolock
static functions).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
