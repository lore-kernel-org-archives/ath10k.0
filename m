Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMHUA-0001ll-Ok
 for ath10k@lists.infradead.org; Wed, 18 Sep 2013 13:08:03 +0000
Received: by mail-bk0-f46.google.com with SMTP id 6so2760841bkj.19
 for <ath10k@lists.infradead.org>; Wed, 18 Sep 2013 06:07:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACKGw+HgRbZU4DV5ZFHZA-X-78nEUd87hDeabMr1r1fRc-yOvw@mail.gmail.com>
References: <1379497651-29933-1-git-send-email-bartosz.markowski@tieto.com>
 <CA+BoTQ=fRoVXNaeiiWUwc_tLiW4GJZnCKJKYO55+JHqOSasAkA@mail.gmail.com>
 <CACKGw+HgRbZU4DV5ZFHZA-X-78nEUd87hDeabMr1r1fRc-yOvw@mail.gmail.com>
Date: Wed, 18 Sep 2013 15:07:24 +0200
Message-ID: <CA+BoTQ=hxXkkFhTJSikoAbCa1CLZE+P7n0dWjYStany6bs9vGA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: implement host memory chunks feature
From: Michal Kazior <michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On 18 September 2013 14:36, Bartosz Markowski
<bartosz.markowski@tieto.com> wrote:
> On 18 September 2013 12:51, Michal Kazior <michal.kazior@tieto.com> wrote:
>> On 18 September 2013 11:47, Bartosz Markowski
>>> +       ar->hif.ops->chunk_free(ar, idx);
>>> +}
>>> +
>>>  #endif /* _HIF_H_ */
>>> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wirele=
ss/ath/ath10k/pci.c
>>> index f1faf46..547d67d 100644
>>> --- a/drivers/net/wireless/ath/ath10k/pci.c
>>> +++ b/drivers/net/wireless/ath/ath10k/pci.c
>>> @@ -1966,6 +1966,49 @@ static int ath10k_pci_hif_resume(struct ath10k *=
ar)
>>>  }
>>>  #endif
>>>
>>> +static int ath10k_pci_hif_chunk_alloc(struct ath10k *ar,
>>> +                                     u32 req_id,
>>> +                                     u32 idx,
>>> +                                     u32 num_units,
>>> +                                     u32 unit_len)
>>> +{
>>> +       dma_addr_t paddr;
>>> +       struct ath10k_pci *ar_pci =3D ath10k_pci_priv(ar);
>>> +
>>> +       if (!num_units  || !unit_len)
>>> +               return 0;
>>> +
>>
>> I'm not seeing any checks against buffer overflow of mem_chunks[req_id].
>
> if (idx =3D=3D ATH10K_MAX_MEM_CHUNKS) in ath10k_wmi_alloc_host_mem ?

Oh, but the check is _after_ call to chunk_alloc(). What if
ath10k_wmi_alloc_host_mem() were to be called while idx =3D=3D MAX?


Micha=B3.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
