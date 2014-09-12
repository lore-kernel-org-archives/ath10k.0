Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSLnp-0006xZ-3C
 for ath10k@lists.infradead.org; Fri, 12 Sep 2014 08:01:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC PATCH 1/3] ath10k: ignore diagnose pipes in
 ath10k_pci_ce_recv_data()/_send_done()
References: <20140911202926.12514.79908.stgit@potku.adurom.net>
 <20140911203141.12514.23469.stgit@potku.adurom.net>
 <CA+BoTQ=9kUFXpTKwE1i8TjEPFeszih+U9FDpWRdaYguf7Xa-Gw@mail.gmail.com>
Date: Fri, 12 Sep 2014 11:01:12 +0300
In-Reply-To: <CA+BoTQ=9kUFXpTKwE1i8TjEPFeszih+U9FDpWRdaYguf7Xa-Gw@mail.gmail.com>
 (Michal Kazior's message of "Fri, 12 Sep 2014 09:53:08 +0200")
Message-ID: <8761gt1d4n.fsf@kamboji.qca.qualcomm.com>
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
>> As ath10k_pci_diag_read_mem() uses polling to receive data from CE, the CE callbacks
>> have to ignore the pipe used for diagnose reads. Otherwise ath10k crashes due
>> to NULL dereference and polling reads timeout.
>>
>> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/pci.c |    6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
>> index baeb98e78b1f..154451ab3e3c 100644
>> --- a/drivers/net/wireless/ath/ath10k/pci.c
>> +++ b/drivers/net/wireless/ath/ath10k/pci.c
>> @@ -819,6 +819,9 @@ static void ath10k_pci_ce_send_done(struct ath10k_ce_pipe *ce_state)
>>         unsigned int nbytes;
>>         unsigned int transfer_id;
>>
>> +       if (ce_state->id == 7)
>> +               return;
>
> I think you can check it in a saner way: (ce_state == ar_pci->ce_diag).
>
> Another approach is to prevent this from happening in the first place
> by never unmasking the diagnostic window copy engine pipe in
> ath10k_ce_enable_interrupts() and preventing
> ath10k_ce_per_engine_service() from being called in
> ath10k_pci_hif_send_complete_check() for the diagnostic ce pipe.

I like the latter approach and I'll try to implement that first. Thanks!

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
