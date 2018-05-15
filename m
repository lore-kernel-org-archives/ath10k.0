Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIWFp-0003ex-KP
 for ath10k@lists.infradead.org; Tue, 15 May 2018 09:28:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCHv2 0/2]  ath/ath10k: DFS Host Confirmation
References: <1526375272-7056-1-git-send-email-srirrama@codeaurora.org>
 <4a37ad008bd28f80ba0d5b34ee756848@codeaurora.org>
Date: Tue, 15 May 2018 12:28:01 +0300
In-Reply-To: <4a37ad008bd28f80ba0d5b34ee756848@codeaurora.org> (Sriram R.'s
 message of "Tue, 15 May 2018 14:44:12 +0530")
Message-ID: <87in7pp8ta.fsf@kamboji.qca.qualcomm.com>
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
To: Sriram R <srirrama@codeaurora.org>
Cc: ath10k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> writes:

> On 2018-05-15 14:37, Sriram R wrote:
>> This feature adds support for the ath10k host to send information
>> about the specifications of the detected radar to the firmware for
>> validation.
>> A New WMI interface is added for enabling this communication
>> of this information between the host and the firmware.
>>
> Hi,
>
>  I've resent this patch series including linux-wireless list since
> i've misspelled 'linux-wirelss@vger.kernel.org'
> mailing list while sending this one.

If you need to resend then it's best to also change the version number
to avoid any confusion (even if there are no changes in the actual
patchset), so the resent version should have been v3.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
