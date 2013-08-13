Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22a.google.com ([2a00:1450:4008:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V96v4-0005Vm-B6
 for ath10k@lists.infradead.org; Tue, 13 Aug 2013 05:13:23 +0000
Received: by mail-bk0-f42.google.com with SMTP id my10so2182820bkb.29
 for <ath10k@lists.infradead.org>; Mon, 12 Aug 2013 22:12:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87li47t276.fsf@kamboji.qca.qualcomm.com>
References: <1375949650-9699-1-git-send-email-michal.kazior@tieto.com>
 <1375949650-9699-3-git-send-email-michal.kazior@tieto.com>
 <87li47t276.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 13 Aug 2013 07:12:57 +0200
Message-ID: <CA+BoTQkj_4RFsjGkEbwgP26wQSYTX05SrtQ3CwwFLKKvH0ik6w@mail.gmail.com>
Subject: Re: [PATCH 2/4] ath10k: use sizeof(*var) in kmalloc
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 12 August 2013 16:26, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> This fixes checkpatch warning from the latest
>> 3.11-rc kernel tree.
>>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/pci.c |    3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireles=
s/ath/ath10k/pci.c
>> index d95439b..1814af1 100644
>> --- a/drivers/net/wireless/ath/ath10k/pci.c
>> +++ b/drivers/net/wireless/ath/ath10k/pci.c
>> @@ -803,8 +803,7 @@ static int ath10k_pci_start_ce(struct ath10k *ar)
>>                       continue;
>>
>>               for (i =3D 0; i < completions; i++) {
>> -                     compl =3D kmalloc(sizeof(struct ath10k_pci_compl),
>> -                                     GFP_KERNEL);
>> +                     compl =3D kmalloc(sizeof(*compl), GFP_KERNEL);
>>                       if (!compl) {
>>                               ath10k_warn("No memory for completion stat=
e\n");
>>                               ath10k_pci_stop_ce(ar);
>
> Just out of curiosity, what's the warning? kmalloc() should be called
> with sizeof(*foo) style?

Checkpatch prints:

  CHECK: Prefer kmalloc(sizeof(*compl)...) over kmalloc(sizeof(struct
ath10k_pci_compl)...)


Pozdrawiam / Best regards,
Micha=B3 Kazior.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
