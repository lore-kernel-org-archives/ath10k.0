Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyJry-0006oN-5V
 for ath10k@lists.infradead.org; Tue, 20 Mar 2018 16:12:20 +0000
Received: by mail-wr0-x244.google.com with SMTP id c24so2286811wrc.6
 for <ath10k@lists.infradead.org>; Tue, 20 Mar 2018 09:12:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <37830d46-762b-2a92-4506-5792a65d2ebd@candelatech.com>
References: <1520452289-14172-1-git-send-email-greearb@candelatech.com>
 <20180320103747.7kcfdu4yzof6bwxw@unicorn.suse.cz>
 <37830d46-762b-2a92-4506-5792a65d2ebd@candelatech.com>
From: Steve deRosier <derosier@gmail.com>
Date: Tue, 20 Mar 2018 09:11:21 -0700
Message-ID: <CALLGbRKU_PCk-3ZMBRu6CC-QyaEEPTAOavGVzPpQUdEMQ+s9BQ@mail.gmail.com>
Subject: Re: [RFC] ethtool: Support ETHTOOL_GSTATS2 command.
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
Cc: Michal Kubecek <mkubecek@suse.cz>, netdev@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Tue, Mar 20, 2018 at 8:39 AM, Ben Greear <greearb@candelatech.com> wrote:
> On 03/20/2018 03:37 AM, Michal Kubecek wrote:
>>
>> On Wed, Mar 07, 2018 at 11:51:29AM -0800, greearb@candelatech.com wrote:
>>>
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>>> This is similar to ETHTOOL_GSTATS, but it allows you to specify
>>> a 'level'.  This level can be used by the driver to decrease the
>>> amount of stats refreshed.  In particular, this helps with ath10k
>>> since getting the firmware stats can be slow.
>>>
>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>>> ---
>>>
>>> NOTE:  I know to make it upstream I would need to split the patch and
>>> remove the #define for 'backporting' that I added.  But, is the
>>> feature in general wanted?  If so, I'll do the patch split and
>>> other tweaks that might be suggested.
>>
>>
>
> Yes, but that would require changing all drivers at once, and would make
> backporting
> and out-of-tree drivers harder to manage.  I had low hopes that this feature
> would
> make it upstream, so I didn't want to propose any large changes up front.
>

Hi Ben,

I find the feature OK, but I'm not thrilled with the arbitrary scale
of "level". Maybe there could be some named values, either on a
spectrum as level already is, similar to the kernel log DEBUG, WARN,
INFO....  type levels. Or named bit flags like the way the ath drivers
do their debug flags for granular results.  Thoughts?

- Steve

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
