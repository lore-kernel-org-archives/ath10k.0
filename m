Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8g4P-0000jR-Jr
 for ath10k@lists.infradead.org; Tue, 26 Mar 2019 07:00:30 +0000
Date: Tue, 26 Mar 2019 10:00:02 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCHv3 1/9] nl80211: New netlink command for TID specific
 configuration
Message-ID: <20190326070002.GB32613@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1551895251-22941-2-git-send-email-tamizhr@codeaurora.org>
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
To: kbuild@01.org, Tamizh chelvam <tamizhr@codeaurora.org>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, kbuild-all@01.org, ath10k@lists.infradead.org

Hi Tamizh,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Tamizh-chelvam/cfg80211-mac80211-Add-support-for-TID-specific-configuration/20190308-195433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git master

New smatch warnings:
net/wireless/nl80211.c:13336 nl80211_set_tid_config() warn: possible memory leak of 'tid_conf'

Old smatch warnings:
net/wireless/nl80211.c:13339 nl80211_set_tid_config() warn: possible memory leak of 'tid_conf'

# https://github.com/0day-ci/linux/commit/e462f4e99ba46deede4c2e78bd343211d372246d
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout e462f4e99ba46deede4c2e78bd343211d372246d
vim +/tid_conf +13336 net/wireless/nl80211.c

e462f4e9 Tamizh chelvam 2019-03-06  13293  
e462f4e9 Tamizh chelvam 2019-03-06  13294  static int nl80211_set_tid_config(struct sk_buff *skb,
e462f4e9 Tamizh chelvam 2019-03-06  13295  				  struct genl_info *info)
e462f4e9 Tamizh chelvam 2019-03-06  13296  {
e462f4e9 Tamizh chelvam 2019-03-06  13297  	struct cfg80211_registered_device *rdev = info->user_ptr[0];
e462f4e9 Tamizh chelvam 2019-03-06  13298  	struct nlattr *attrs[NL80211_ATTR_TID_CONFIG_MAX + 1];
e462f4e9 Tamizh chelvam 2019-03-06  13299  	struct net_device *dev = info->user_ptr[1];
e462f4e9 Tamizh chelvam 2019-03-06  13300  	struct ieee80211_tid_config *tid_conf;
e462f4e9 Tamizh chelvam 2019-03-06  13301  	struct nlattr *tid;
e462f4e9 Tamizh chelvam 2019-03-06  13302  	int conf_idx = 0, rem_conf;
e462f4e9 Tamizh chelvam 2019-03-06  13303  	u32 num_conf = 0, size_of_conf;
e462f4e9 Tamizh chelvam 2019-03-06  13304  	int ret = -EINVAL;
e462f4e9 Tamizh chelvam 2019-03-06  13305  
e462f4e9 Tamizh chelvam 2019-03-06  13306  	if (!info->attrs[NL80211_ATTR_TID_CONFIG])
e462f4e9 Tamizh chelvam 2019-03-06  13307  		return -EINVAL;
e462f4e9 Tamizh chelvam 2019-03-06  13308  
e462f4e9 Tamizh chelvam 2019-03-06  13309  	if (!rdev->ops->set_tid_config)
e462f4e9 Tamizh chelvam 2019-03-06  13310  		return -EOPNOTSUPP;
e462f4e9 Tamizh chelvam 2019-03-06  13311  
e462f4e9 Tamizh chelvam 2019-03-06  13312  	nla_for_each_nested(tid, info->attrs[NL80211_ATTR_TID_CONFIG],
e462f4e9 Tamizh chelvam 2019-03-06  13313  			    rem_conf)
e462f4e9 Tamizh chelvam 2019-03-06  13314  		num_conf++;
e462f4e9 Tamizh chelvam 2019-03-06  13315  
e462f4e9 Tamizh chelvam 2019-03-06  13316  	size_of_conf = sizeof(struct ieee80211_tid_config) +
e462f4e9 Tamizh chelvam 2019-03-06  13317  		num_conf * sizeof(struct ieee80211_tid_cfg);
e462f4e9 Tamizh chelvam 2019-03-06  13318  
e462f4e9 Tamizh chelvam 2019-03-06  13319  	tid_conf = kzalloc(size_of_conf, GFP_KERNEL);
e462f4e9 Tamizh chelvam 2019-03-06  13320  	if (!tid_conf)
e462f4e9 Tamizh chelvam 2019-03-06  13321  		return -ENOMEM;
e462f4e9 Tamizh chelvam 2019-03-06  13322  
e462f4e9 Tamizh chelvam 2019-03-06  13323  	tid_conf->n_tid_conf = num_conf;
e462f4e9 Tamizh chelvam 2019-03-06  13324  
e462f4e9 Tamizh chelvam 2019-03-06  13325  	if (info->attrs[NL80211_ATTR_MAC])
e462f4e9 Tamizh chelvam 2019-03-06  13326  		tid_conf->peer = nla_data(info->attrs[NL80211_ATTR_MAC]);
e462f4e9 Tamizh chelvam 2019-03-06  13327  	else
e462f4e9 Tamizh chelvam 2019-03-06  13328  		tid_conf->peer = NULL;
e462f4e9 Tamizh chelvam 2019-03-06  13329  
e462f4e9 Tamizh chelvam 2019-03-06  13330  	nla_for_each_nested(tid, info->attrs[NL80211_ATTR_TID_CONFIG],
e462f4e9 Tamizh chelvam 2019-03-06  13331  			    rem_conf) {
e462f4e9 Tamizh chelvam 2019-03-06  13332  		ret = nla_parse_nested(attrs, NL80211_ATTR_TID_CONFIG_MAX, tid,
e462f4e9 Tamizh chelvam 2019-03-06  13333  				       NULL, NULL);
e462f4e9 Tamizh chelvam 2019-03-06  13334  
e462f4e9 Tamizh chelvam 2019-03-06  13335  		if (ret)
e462f4e9 Tamizh chelvam 2019-03-06 @13336  			return ret;
e462f4e9 Tamizh chelvam 2019-03-06  13337  
e462f4e9 Tamizh chelvam 2019-03-06  13338  		if (!attrs[NL80211_ATTR_TID_CONFIG_TID])
e462f4e9 Tamizh chelvam 2019-03-06  13339  			return -EINVAL;
e462f4e9 Tamizh chelvam 2019-03-06  13340  
e462f4e9 Tamizh chelvam 2019-03-06  13341  		ret = parse_tid_conf(rdev, attrs, &tid_conf->tid_conf[conf_idx],
e462f4e9 Tamizh chelvam 2019-03-06  13342  				     tid_conf->peer);
e462f4e9 Tamizh chelvam 2019-03-06  13343  		if (ret)
e462f4e9 Tamizh chelvam 2019-03-06  13344  			goto bad_tid_conf;
e462f4e9 Tamizh chelvam 2019-03-06  13345  
e462f4e9 Tamizh chelvam 2019-03-06  13346  		conf_idx++;
e462f4e9 Tamizh chelvam 2019-03-06  13347  	}
e462f4e9 Tamizh chelvam 2019-03-06  13348  
e462f4e9 Tamizh chelvam 2019-03-06  13349  	ret = rdev_set_tid_config(rdev, dev, tid_conf);
e462f4e9 Tamizh chelvam 2019-03-06  13350  
e462f4e9 Tamizh chelvam 2019-03-06  13351  bad_tid_conf:
e462f4e9 Tamizh chelvam 2019-03-06  13352  	kfree(tid_conf);
e462f4e9 Tamizh chelvam 2019-03-06  13353  	return ret;
e462f4e9 Tamizh chelvam 2019-03-06  13354  }
e462f4e9 Tamizh chelvam 2019-03-06  13355  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
