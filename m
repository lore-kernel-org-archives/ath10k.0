Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UyekC-0006eu-LA
 for ath10k@lists.infradead.org; Mon, 15 Jul 2013 09:06:57 +0000
Received: by mail-la0-f43.google.com with SMTP id gw10so9259272lab.16
 for <ath10k@lists.infradead.org>; Mon, 15 Jul 2013 02:06:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87mwpop93v.fsf@kamboji.qca.qualcomm.com>
References: <1373624746-3244-1-git-send-email-janusz.dziedzic@tieto.com>
 <87mwpop93v.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 15 Jul 2013 11:06:31 +0200
Message-ID: <CALhHN=pGFRS8CW31vq0gRAmos-yPRVUffVi_QibbNVLq7x-ObA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: pass also QOS Null frames through mgmt tx path
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

  On 15 July 2013 09:37, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> Fw will report wrong tx status for QOS Null frames
>> sent through data tx path.
>>
>> This patch fixes station(s) keep alive detection
>> triggered from wpa_supplicant/hostapd when work
>> as AP/GO and WMM enabled.
>>
>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>
> I think you mentioned privately that this patch should be dropped. Is
> that still the case?
>

Yes, please drop this patch

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
