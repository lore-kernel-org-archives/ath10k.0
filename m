Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzo2l-0000hl-Bj
 for ath10k@lists.infradead.org; Fri, 20 Nov 2015 15:56:14 +0000
References: <87mvuj585b.fsf@kamboji.qca.qualcomm.com>
 <1447826363-16818-1-git-send-email-michal.kazior@tieto.com>
 <1447826363-16818-10-git-send-email-michal.kazior@tieto.com>
 <564DE65C.9030407@dd-wrt.com> <564DEBBE.1040308@candelatech.com>
 <564DEC25.1030401@dd-wrt.com> <564DF53C.50009@candelatech.com>
 <564E02F1.3090306@dd-wrt.com> <564E130D.4080201@dd-wrt.com>
 <87wptcsx8b.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <564F428B.7050703@dd-wrt.com>
Date: Fri, 20 Nov 2015 16:55:55 +0100
MIME-Version: 1.0
In-Reply-To: <87wptcsx8b.fsf@kamboji.qca.qualcomm.com>
Subject: Re: QCA998X not working at all
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org


the patch subjected with:  ath10k: use pre-allocated DMA buffer in Tx
must be reverted.
it will lead to out of memory when using multiple cards on ipq806x. it 
seems that there isnt enough dma buffer available on this platform
reverting this patch will fix it

Am 20.11.2015 um 12:53 schrieb Kalle Valo:
> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>
>> simple solution.
>>
>> as for ath9k. otp must be ignored for various chipsets, since they
>> wont return valid results
>>
>> --- core.c (Revision 2702)
>> +++ core.c (Arbeitskopie)
>> @@ -1735,9 +1735,8 @@
>>
>>    ret = ath10k_core_get_board_id_from_otp(ar);
>>    if (ret && ret != -EOPNOTSUPP) {
>> -  ath10k_err(ar, "failed to get board id from otp for qca99x0: %d\n",
>> +  ath10k_err(ar, "failed to get board id from otp for qca99x0: %d,
>> ignore\n",
>>           ret);
>> -  return ret;
>>    }
>>
>>    ret = ath10k_core_fetch_board_file(ar);
> I'm guessing in your case otp.bin crashes as the calibration data is in
> flash (and not in otp). Can you send dmesg from a successful ath10k boot
> so that I can verify ath10k reads the calibration data from a file?
>
> I think I have an idea how to cleanly fix this.
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
