Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8QhJ-00048g-QM
 for ath10k@lists.infradead.org; Wed, 19 Aug 2020 16:12:26 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 2/2] ath10k: add fw coredump for sdio when firmware
 assert
References: <1569310030-834-1-git-send-email-wgong@codeaurora.org>
 <1569310030-834-3-git-send-email-wgong@codeaurora.org>
 <87mu2xkwv9.fsf@codeaurora.org>
 <103b604e367a150850d4e8fe179c727f@codeaurora.org>
Date: Wed, 19 Aug 2020 19:00:50 +0300
In-Reply-To: <103b604e367a150850d4e8fe179c727f@codeaurora.org> (Wen Gong's
 message of "Tue, 18 Aug 2020 17:23:05 +0800")
Message-ID: <87tuwyiq19.fsf@codeaurora.org>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> On 2020-08-15 00:36, Kalle Valo wrote:
>> Wen Gong <wgong@codeaurora.org> writes:
>>
>> I did some changes in the pending branch, please check:
>>
> I compared this patch with patch in pending branch, it is OK for me.

Great, thanks for testing.

I also did some changes to the commit log and added an example output of
a firmware crash.

> [ 1378.680788] ath10k_sdio mmc1:0001:1: check fw reg : 400

But I could not find this message anywhere in upstream ath10k so I
assumed it's from an out-of-tree patch and removed it from the example.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
