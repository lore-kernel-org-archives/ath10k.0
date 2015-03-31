Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcuGK-0007lK-NU
 for ath10k@lists.infradead.org; Tue, 31 Mar 2015 11:23:17 +0000
Received: by lboc7 with SMTP id c7so9867048lbo.1
 for <ath10k@lists.infradead.org>; Tue, 31 Mar 2015 04:22:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87iodi4oex.fsf@kamboji.qca.qualcomm.com>
References: <1427271291-31683-1-git-send-email-janusz.dziedzic@tieto.com>
 <87iodi4oex.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 31 Mar 2015 13:22:53 +0200
Message-ID: <CAFED-jmARkKvUemR-rOT8JG2nZad3ctm674QGUqcSXeFw32zqQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: disable burst mode
From: Janusz Dziedzic <janusz.dziedzic@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

2015-03-30 15:15 GMT+02:00 Kalle Valo <kvalo@qca.qualcomm.com>:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> Firmwares that indicate BURST_SERVICE as enabled
>> could overwrite some wmm parameters (eg. txop).
>> This could lead IOT and balancing issues.
>> Hence disable this by default.
>>
>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>
> There was a trivial conflict, please check my resolution in the pending
> branch.
>
Looks good. Thanks

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
