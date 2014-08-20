Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XK0LR-0000Y5-CP
 for ath10k@lists.infradead.org; Wed, 20 Aug 2014 07:30:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v7 2/8] ath10k: provide firmware crash info via debugfs
References: <20140819082038.16842.46876.stgit@potku.adurom.net>
 <20140819082253.16842.32433.stgit@potku.adurom.net>
 <CA+BoTQn2aq5EV4mvTs3Ww4i9gAJsmMM5iDfrFd=YfC0YxMi2WQ@mail.gmail.com>
 <53F36C63.8040809@candelatech.com>
Date: Wed, 20 Aug 2014 10:29:27 +0300
In-Reply-To: <53F36C63.8040809@candelatech.com> (Ben Greear's message of "Tue, 
 19 Aug 2014 08:25:23 -0700")
Message-ID: <87tx5762lk.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

>>> +       /* Gather dbg-log */
>>> +       dump_tlv = (struct ath10k_tlv_dump_data *)(buf + sofar);
>>> +       dump_tlv->type = cpu_to_le32(ATH10K_FW_CRASH_DUMP_DBGLOG);
>>> +       dump_tlv->tlv_len = cpu_to_le32(sizeof(crash_data->dbglog_entry_data));
>>
>> Hmm should this really be sizeof()? Not next_idx (which effectively
>> defines number of bytes of the dbglog)?
>
> I haven't tried decoding this yet, but we may need to know the next_idx
> to decode this properly.

I really don't like the idea of having untested code in ath10k. Buggy
code is okay (preferably document the known bugs when submitting code),
but untested code is not.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
