Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-5.mailgun.net ([69.72.42.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkWv3-0007Ak-Cg
 for ath10k@lists.infradead.org; Wed, 02 Dec 2020 18:32:02 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: Fix the parsing error in service available
 event
References: <1605501291-23040-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=Xnk-VeZKy3vzr4VZNW+OogfwEAjU-QVHQRYD-yix8LPQ@mail.gmail.com>
Date: Wed, 02 Dec 2020 20:31:55 +0200
In-Reply-To: <CAD=FV=Xnk-VeZKy3vzr4VZNW+OogfwEAjU-QVHQRYD-yix8LPQ@mail.gmail.com>
 (Doug Anderson's message of "Fri, 20 Nov 2020 16:26:07 -0800")
Message-ID: <87a6uwhxes.fsf@codeaurora.org>
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
To: Doug Anderson <dianders@chromium.org>
Cc: Abhishek Kumar <kuabhs@chromium.org>, Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Rakesh Pillai <pillair@codeaurora.org>

Doug Anderson <dianders@chromium.org> writes:

> Hi,
>
> On Sun, Nov 15, 2020 at 8:35 PM Rakesh Pillai <pillair@codeaurora.org> wrote:
>>
>> The wmi service available event has been
>> extended to contain extra 128 bit for new services
>> to be indicated by firmware.
>>
>> Currently the presence of any optional TLVs in
>> the wmi service available event leads to a parsing
>> error with the below error message:
>> ath10k_snoc 18800000.wifi: failed to parse svc_avail tlv: -71
>>
>> The wmi service available event parsing should
>> not return error for the newly added optional TLV.
>> Fix this parsing for service available event message.
>>
>> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00720-QCAHLSWMTPL-1
>>
>> Fixes: cea19a6ce8bf ("ath10k: add WMI_SERVICE_AVAILABLE_EVENT support")
>> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
>> ---
>> Changes from v2:
>> - Add code documentation explaining the necessity of variable
>>   initialization for the logic to work.
>> ---
>>  drivers/net/wireless/ath/ath10k/wmi-tlv.c | 4 +++-
>>  drivers/net/wireless/ath/ath10k/wmi.c     | 9 +++++++--
>>  drivers/net/wireless/ath/ath10k/wmi.h     | 1 +
>>  3 files changed, 11 insertions(+), 3 deletions(-)
>
> This looks nice to me now.  I will let Kalle decide what to do about
> the checkpatch issue that Abhishek found (ignore, fix himself, or
> request another spin).

Currently ath10k uses mixed of both comment styles and I have disabled
that patchwork check in my ath10k-check script. I should finally try to
unify that and make all ath10k comments to use the networking style,
patches very welcome :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
