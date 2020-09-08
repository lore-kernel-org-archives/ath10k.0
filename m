Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFUZT-0007W5-VZ
 for ath10k@lists.infradead.org; Tue, 08 Sep 2020 03:45:29 +0000
MIME-Version: 1.0
Date: Tue, 8 Sep 2020 03:45:24 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: add flag to protect napi operation to avoid
 dead loop hang
In-Reply-To: <87d02x1rqb.fsf@codeaurora.org>
References: <1598617348-2325-1-git-send-email-wgong@codeaurora.org>
 <87d02x1rqb.fsf@codeaurora.org>
Message-ID: <010101746bd17881-819242de-7cbb-4df3-93e2-59473d281155-000000@us-west-2.amazonses.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2020-09-08 00:22, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> writes:
[...]
> Just like with the recent firmware restart patch, isn't 
> ar->napi_enabled
> racy? Wouldn't test_and_set_bit() and test_and_clear_bit() be safer?
> 
> Or are we holding a lock? But then that should be documented with
> lockdep_assert_held().
yes, ath10k_hif_start is only called from ath10k_core_start, it has 
"lockdep_assert_held(&ar->conf_mutex)",
and ath10k_hif_stop is only called from ath10k_core_stop, it also has 
"lockdep_assert_held(&ar->conf_mutex)".
then it will not 2 thread both enter ath10k_hif_start/ath10k_hif_stop 
meanwhile.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
