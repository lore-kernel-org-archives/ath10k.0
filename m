Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHSQ9-00035x-C0
 for ath10k@lists.infradead.org; Thu, 26 Mar 2020 13:19:43 +0000
MIME-Version: 1.0
Date: Thu, 26 Mar 2020 18:49:29 +0530
From: ssreeela@codeaurora.org
Subject: Re: [PATCH] ath10k: enable radar detection in secondary segment
In-Reply-To: <87o8sj2zz7.fsf@kamboji.qca.qualcomm.com>
References: <1585158041-11740-1-git-send-email-ssreeela@codeaurora.org>
 <20200326100139.5BC86C433BA@smtp.codeaurora.org>
 <87o8sj2zz7.fsf@kamboji.qca.qualcomm.com>
Message-ID: <1b4c3f1ecaa1acb7684c35010a4e3316@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Lei Wang <leiwa@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2020-03-26 15:35, Kalle Valo wrote:
> Kalle Valo <kvalo@codeaurora.org> writes:
> 
>> Sowmiya Sree Elavalagan <ssreeela@codeaurora.org> wrote:
>> 
>>> From: Lei Wang <leiwa@codeaurora.org>
>>> 
>>> Enable radar detection in secondary segment for VHT160 and VHT80+80 
>>> mode
>>> on DFS channels. Otherwise, when injecting radar pulse in the 
>>> secondary
>>> segment, the DUT can't detect radar pulse.
>>> 
>>> Tested: qca9984 with firmware ver 10.4-3.10-00047
>>> 
>>> Signed-off-by: Lei Wang <leiwa@codeaurora.org>
>>> Signed-off-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
>> 
>> Failed to apply:
>> 
>> error: patch failed: drivers/net/wireless/ath/ath10k/wmi.c:1717
>> error: drivers/net/wireless/ath/ath10k/wmi.c: patch does not apply
>> stg import: Diff does not apply cleanly
>> 
>> Patch set to Changes Requested.
> 
> I guess this depends on "ath10k: enable VHT160 and VHT80+80 modes"? If
> that's the case then you should submit them in the same patchset to 
> make
> the dependency clear.

Yes, this patch is dependent on ath10k: enable VHT160 and VHT80+80 
modes.
Sure will update and send.

Thanks,
Sowmiya Sree

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
